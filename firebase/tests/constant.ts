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

export const orgsRef = (db: firebase.firestore.Firestore) =>
    db.collection('organizations');

export const collectUser = {
  id: 'test',
  email: 'test@example.com',
  icon_url: 'https://example.com/example.png',
  name: 'テスト太郎',
  role: 'アルバイト',
  level: '100'
};

export const ownerUser = {
  id: 'owner',
  email: 'owner@example.com',
  icon_url: 'https://example.com/owner.png',
  name: 'テスト店長',
  role: '店長',
  level: '100'
}

export const memberUser = {
  id: 'member',
  email: 'member@example.com',
  icon_url: 'https://example.com/member.png',
  name: 'テストメンバー',
  role: 'アルバイト',
  level: '100'
}

export const collectOrganization = {
  id: 'test_organization',
  owner_ids: [
    ownerUser.id,
  ],
  member_ids: [
    ownerUser.id,
    memberUser.id,
  ],
  default_holidays: [
    {
      day_of_week: 0,
      n_week: 0,
    },
    {
      day_of_week: 1,
      n_week: 1,
    },
  ],
}
