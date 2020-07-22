import * as firebase from '@firebase/testing';

import {clearData, collectUser, createAdminApp, createAuthApp, deleteApp, loadRules, usersRef} from './constant';

describe('Userモデルについてのセキュリティルール', () => {
  // ルールファイルの読み込み
  beforeAll(async () => {await loadRules()});

  // Firestoreデータのクリーンアップ
  afterEach(async () => {await clearData()});

  // Firestoreアプリの削除
  afterAll(async () => {await deleteApp()});

  describe('ユーザ認証情報の検証', () => {
    test(
        '自分のuidと同様のドキュメントIDのユーザ情報だけを閲覧，作成，編集，削除可能',
        async () => {
          const db = createAuthApp({uid: collectUser.id});
          const userDocumentRef = usersRef(db).doc(collectUser.id);

          await firebase.assertSucceeds(userDocumentRef.set(collectUser));
          await firebase.assertSucceeds(userDocumentRef.get());

          await firebase.assertSucceeds(
              userDocumentRef.update({name: '更新し太郎'}));

          await firebase.assertSucceeds(userDocumentRef.delete());
        });
    test(
        '自分のuidと異なるドキュメントは閲覧，作成，編集，削除ができない',
        async () => {
          usersRef(createAdminApp()).doc(collectUser.id).set(collectUser);
          const db = createAuthApp({uid: 'invalid_user'});

          const userDocumentRef = usersRef(db).doc(collectUser.id);

          await firebase.assertFails(userDocumentRef.set(collectUser));

          await firebase.assertFails(userDocumentRef.get());

          await firebase.assertFails(
              userDocumentRef.update({name: '更新し太郎'}));

          await firebase.assertFails(userDocumentRef.delete());
        })
  });

  describe('user スキーマの検証', () => {
    test('正しくないスキーマの場合は作成できない', async () => {
      const db = createAuthApp({uid: collectUser.id});
      const userDocumentRef = usersRef(db).doc(collectUser.id);

      await firebase.assertFails(
          userDocumentRef.set({...collectUser, place: 'japan'}));

      await firebase.assertFails(
          userDocumentRef.set({...collectUser, id: 1234}));
      await firebase.assertFails(
          userDocumentRef.set({...collectUser, name: 1234}));
      await firebase.assertFails(
          userDocumentRef.set({...collectUser, email: 1234}));
      await firebase.assertFails(
          userDocumentRef.set({...collectUser, icon_url: 1234}));
      await firebase.assertFails(
          userDocumentRef.set({...collectUser, role: 1234}));
      await firebase.assertFails(
          userDocumentRef.set({...collectUser, level: 1234}));
    });
    test('正しくないスキーマの場合は編集できない', async () => {
      usersRef(createAdminApp()).doc(collectUser.id).set(collectUser);
      const db = createAuthApp({uid: collectUser.id});
      const userDocumentRef = usersRef(db).doc(collectUser.id);

      await firebase.assertFails(
          userDocumentRef.update({...collectUser, place: 'japan'}));

      await firebase.assertFails(
          userDocumentRef.update({...collectUser, id: 1234}));
      await firebase.assertFails(
          userDocumentRef.update({...collectUser, name: 1234}));
      await firebase.assertFails(
          userDocumentRef.update({...collectUser, email: 1234}));
      await firebase.assertFails(
          userDocumentRef.update({...collectUser, icon_url: 1234}));
      await firebase.assertFails(
          userDocumentRef.update({...collectUser, role: 1234}));
      await firebase.assertFails(
          userDocumentRef.update({...collectUser, level: 1234}));
    });
  });
});
