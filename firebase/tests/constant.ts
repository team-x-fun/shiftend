import * as firebase from '@firebase/testing';
import * as fs from 'fs';

export const PROJECT_ID = 'shiftend-47fca';
export const RULES_PATH = 'firestore.rules';

// 認証付きのFreistore appを作成する
export const createAuthApp = (auth?: object): firebase.firestore.Firestore => {
  return firebase.initializeTestApp({projectId: PROJECT_ID, auth: auth})
      .firestore();
};

// 管理者権限で操作できるFreistore appを作成する
export const createAdminApp = (): firebase.firestore.Firestore => {
  return firebase.initializeAdminApp({projectId: PROJECT_ID}).firestore();
};

export const loadRules = () =>　firebase.loadFirestoreRules(
    {projectId: PROJECT_ID, rules: fs.readFileSync(RULES_PATH, 'utf8')});

export const clearData = () =>
    firebase.clearFirestoreData({projectId: PROJECT_ID});

export const deleteApp = () =>
    Promise.all(firebase.apps().map(app => app.delete()));

// user情報への参照を作る
export const usersRef = (db: firebase.firestore.Firestore) =>
    db.collection('users');

export const collectUser = {
  id: 'test',
  email: 'test@example.com',
  icon_url: 'https://example.com/example.png',
  name: 'テスト太郎',
  role: 'アルバイト',
  level: '100'
};
