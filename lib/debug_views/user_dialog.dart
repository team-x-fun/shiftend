import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

import 'globals.dart';

class UserDialog {
  static Future getUser(BuildContext context) async {
    try {
      firebaseUser = auth.currentUser;
      if (firebaseUser == null) {
        await auth.signInAnonymously();
        firebaseUser = auth.currentUser;
      }
    } on Exception {
      print('ログインに失敗しました．');
    }
  }

  static void showLoginDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String email, password;

    if (firebaseUser.isAnonymous) {
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('ログイン/登録ダイアログ'),
          content: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    labelText: 'Email',
                  ),
                  onSaved: (String value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Emailは必須入力項目です．';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: 'Password',
                  ),
                  onSaved: (String value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Passwordは必須入力項目です．';
                    }
                    if (value.length < 6) {
                      return 'Passwordは6桁以上です．';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('キャンセル'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: const Text('登録'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _createUser(context, email, password);
                }
              },
            ),
            FlatButton(
              child: const Text('ログイン'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _signIn(context, email, password);
                }
              },
            )
          ],
        ),
      );
    } else {
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('確認ダイアログ'),
          content: Text('${firebaseUser.email}でログインしています'),
          actions: <Widget>[
            FlatButton(
              child: const Text('キャンセル'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: const Text('ログアウト'),
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }
  }

  static Future _signIn(
      BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on Exception {
      print('ログインに失敗しました．');
    }
  }

  static Future _createUser(
      BuildContext context, String email, String password) async {
    try {
      User user;
      await auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password)
          .then((authResult) => {
                user = User(
                    id: authResult.user.uid,
                    email: email.trim(),
                    name: email.trim(),
                    role: 'アルバイト',
                    level: '100',
                    iconUrl:
                        'https://avatars0.githubusercontent.com/u/57802072'),
                userRepo.create(user)
              });
    } on Exception {
      print('ユーザ登録に失敗しました．');
    }
  }

  static Future showUpdateDialog(BuildContext context) async {
    User user = await userRepo.getCurrentUser();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    await showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('更新ダイアログ'),
        content: Column(
          children: <Widget>[
            Text('${firebaseUser.email}でログインしています'),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: 'Name',
                    ),
                    onSaved: (String value) {
                      user = user.copyWith(name: value);
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Role',
                    ),
                    onSaved: (String value) {
                      user = user.copyWith(role: value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('キャンセル'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: const Text('更新'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                userRepo.update(user);
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
