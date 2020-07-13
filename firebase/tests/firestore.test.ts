import * as firebase from '@firebase/testing';
import * as fs from 'fs';

const PROJECT_ID = 'shiftend-47fca';
const RULES_PATH = 'firestore.rules';

// 認証付きのFreistore appを作成する
const createAuthApp = (auth?: object): firebase.firestore.Firestore => {
  return firebase.initializeTestApp({projectId: PROJECT_ID, auth: auth})
      .firestore();
};

// 管理者権限で操作できるFreistore appを作成する
const createAdminApp = (): firebase.firestore.Firestore => {
  return firebase.initializeAdminApp({projectId: PROJECT_ID}).firestore();
};

// user情報への参照を作る
const usersRef = (db: firebase.firestore.Firestore) => db.collection('user');

describe('Firestoreセキュリティルール', () => {
  // ルールファイルの読み込み
  beforeAll(async () => {
    await firebase.loadFirestoreRules(
        {projectId: PROJECT_ID, rules: fs.readFileSync(RULES_PATH, 'utf8')});
  });

  // Firestoreデータのクリーンアップ
  afterEach(async () => {
    await firebase.clearFirestoreData({projectId: PROJECT_ID});
  });

  // Firestoreアプリの削除
  afterAll(async () => {
    await Promise.all(firebase.apps().map(app => app.delete()));
  });

  test('読み書きが可能', async () => {
    const db = createAuthApp({uid: 'test'});
    const user = usersRef(db).doc('test');
    await firebase.assertSucceeds(user.set({name: '太郎'}));
    await firebase.assertSucceeds(user.get());
  });
});
