import * as firebase from '@firebase/testing';

import {clearData, collectOrganization, collectUser, createAdminApp, createAuthApp, deleteApp, loadRules, memberUser, orgsRef, ownerUser, usersRef} from './constant';

describe('Organizationモデルについてのセキュリティルール', () => {
  // ルールファイルの読み込み
  beforeAll(async () => {await loadRules()});

  // Firestoreデータのクリーンアップ
  afterEach(async () => {await clearData()});

  // Firestoreアプリの削除
  afterAll(async () => {await deleteApp()});

  describe('組織に対する権限の検証', () => {
    test('認証ユーザであれば，組織を作成可能', async () => {
      const db = createAuthApp({uid: collectUser.id});
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);

      await firebase.assertSucceeds(orgDocumentRef.set(collectOrganization));
    });
    test('非認証ユーザは，組織を作成不可', async () => {
      const db = createAuthApp();
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);
      await firebase.assertFails(orgDocumentRef.set(collectOrganization));
    })
    test('オーナーである組織を，閲覧，編集，削除可能', async () => {
      const db = createAuthApp({uid: collectUser.id});
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);
      await orgDocumentRef.set(collectOrganization);

      await firebase.assertSucceeds(orgDocumentRef.get());
      await firebase.assertSucceeds(
          orgDocumentRef.update({
            members: [
              collectUser.id,
              'added_member',
            ],
          }),
      );
      await firebase.assertSucceeds(orgDocumentRef.delete());
    });
    test('メンバーである組織を閲覧可能', async () => {
      const adminDb = createAdminApp();
      await orgsRef(adminDb)
          .doc(collectOrganization.id)
          .set(collectOrganization);

      const db = createAuthApp({uid: memberUser.id})
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);

      await firebase.assertSucceeds(orgDocumentRef.get());
    });
    test('オーナーでないメンバーは組織を編集，削除できない', async () => {
      const adminDb = createAdminApp();
      await orgsRef(adminDb)
          .doc(collectOrganization.id)
          .set(collectOrganization);

      const db = createAuthApp({uid: memberUser.id})
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);

      await firebase.assertFails(
          orgDocumentRef.update({
            members: [
              collectUser.id,
              'added_member',
            ],
          }),
      );
      await firebase.assertFails(orgDocumentRef.delete());
    });
    test('メンバー外は組織を閲覧，編集，削除できない', async () => {
      const adminDb = createAdminApp();
      await orgsRef(adminDb)
          .doc(collectOrganization.id)
          .set(collectOrganization);

      const db = createAuthApp({uid: collectUser.id})
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);

      await firebase.assertFails(orgDocumentRef.get());
      await firebase.assertFails(
          orgDocumentRef.update({
            members: [
              collectUser.id,
              'added_member',
            ],
          }),
      );
      await firebase.assertFails(orgDocumentRef.delete());
    })
  });

  describe('組織スキーマの検証', () => {
    test('正しくないスキーマの場合は作成できない', async () => {
      const db = createAuthApp({uid: ownerUser.id});
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);

      await firebase.assertFails(
          orgDocumentRef.set({...collectOrganization, place: 'japan'}));
      await firebase.assertFails(orgDocumentRef.set({
        ...collectOrganization,
        id: 1234,
      }));
      await firebase.assertFails(orgDocumentRef.set({
        ...collectOrganization,
        owner_ids: [],
      }));
      await firebase.assertFails(orgDocumentRef.set({
        ...collectOrganization,
        owner_ids: [
          1,
        ],
      }));
      await firebase.assertFails(orgDocumentRef.set({
        ...collectOrganization,
        member_ids: [],
      }));
      await firebase.assertFails(orgDocumentRef.set({
        ...collectOrganization,
        member_ids: [
          1,
        ]
      }));
      await firebase.assertFails(orgDocumentRef.set({
        ...collectOrganization,
        default_holidays: [
          {
            youbi: 0,
            dainann: 0,
          },
        ]
      }));
      await firebase.assertFails(orgDocumentRef.set({
        ...collectOrganization,
        default_holidays: [
          {
            day_of_week: '火曜日',
            n_week: '隔週',
          },
        ]
      }));
    });

    test('正しくないスキーマの場合は編集できない', async () => {
      const db = createAuthApp({uid: ownerUser.id});
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);

      await firebase.assertFails(
          orgDocumentRef.update({...collectOrganization, place: 'japan'}));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        id: 1234,
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        owner_ids: [],
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        owner_ids: [
          1,
        ],
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        member_ids: [],
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        member_ids: [
          1,
        ]
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        default_holidays: [
          {
            youbi: 0,
            dainann: 0,
          },
        ]
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        default_holidays: [
          {
            day_of_week: '火曜日',
            n_week: '隔週',
          },
        ]
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        default_holidays: [
          {
            day_of_week: 1,
            n_week: 0,
            add: 'hogehoge',
          },
        ]
      }));
    });

    test('定休日の境界値', async () => {
      const db = createAuthApp({uid: ownerUser.id});
      const orgDocumentRef = orgsRef(db).doc(collectOrganization.id);
      await orgDocumentRef.set(collectOrganization);

      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        default_holidays: [
          {
            day_of_week: -1,
            n_week: 0,
          },
        ]
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        default_holidays: [
          {
            day_of_week: 7,
            n_week: 0,
          },
        ]
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        default_holidays: [
          {
            day_of_week: 1,
            n_week: -1,
          },
        ]
      }));
      await firebase.assertFails(orgDocumentRef.update({
        ...collectOrganization,
        default_holidays: [
          {
            day_of_week: 1,
            n_week: 5,
          },
        ]
      }));
    });
  });
});
