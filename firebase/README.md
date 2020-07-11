# firebaseの設定フォルダ

## setting

```sh
$ npm install -g firebase-tools
$ npm i
$ firebase login
$ firebase setup:emulators:firestore
```

## testing

```sh
$ firebase emulators:start --only firestore
$ npm test
```

## deploy

```sh
$ firebase deploy --only firestore
```
