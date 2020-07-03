import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/repositories/user_repository.dart';

import 'globals.dart' as globals;

class DebugPage extends StatelessWidget {
  UserRepository userRepo =
      UserRepository(auth: globals.auth, firestore: Firestore.instance);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      FlatButton(
        child: const Text('user load'),
        onPressed: () {
          print('pressed user load');
          _getUser(context);
        },
      ),
      FlatButton(
        child: const Text('user login'),
        onPressed: () {
          print('pressed user login');
          showBasicDialog(context);
        },
      ),
      FlatButton(
        child: const Text('user update'),
        onPressed: () {
          print('pressed user update');
          _updateUser(context);
        },
      ),
    ]));
  }

  Future _getUser(BuildContext context) async {
    try {
      globals.firebaseUser = await globals.auth.currentUser();
      if (globals.firebaseUser == null) {
        await globals.auth.signInAnonymously();
        globals.firebaseUser = await globals.auth.currentUser();
      }
    } catch (e) {
      print('ログインに失敗しました．');
    }
  }

  void showBasicDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String email, password;

    if (globals.firebaseUser.isAnonymous) {
      showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("ログイン/登録ダイアログ"),
          content: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.mail),
                    labelText: 'Email',
                  ),
                  onSaved: (String value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Emailは必須入力項目です．';
                    }
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.vpn_key),
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
                title: const Text("確認ダイアログ"),
                content: Text(globals.firebaseUser.email + "でログインしています"),
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
                      globals.auth.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (_) => false);
                    },
                  )
                ],
              ));
    }
  }

  Future _signIn(BuildContext context, String email, String password) async {
    try {
      await globals.auth
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('ログインに失敗しました．');
    }
  }

  Future _createUser(
      BuildContext context, String email, String password) async {
    try {
      User user;
      await globals.auth
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
    } catch (e) {
      print('ユーザ登録に失敗しました．');
    }
  }

  Future _updateUser(BuildContext context) async {
    User user = await userRepo.getCurrentUser();
    user = user.copyWith(name: 'updated', role: 'updated');
    userRepo.update(user);
  }
}
