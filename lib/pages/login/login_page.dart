import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/login/login_state_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              child: const Text('Register/Login'),
              onPressed: () {
                _showLoginDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String email, password;
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
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                await Provider.of<LoginStateController>(context, listen: false)
                    .register(email, password);
                Navigator.pop(context);
              }
            },
          ),
          FlatButton(
            child: const Text('ログイン'),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                await Provider.of<LoginStateController>(context, listen: false)
                    .signIn(email, password);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
