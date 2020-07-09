import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/debug_views/user_dialog.dart';

import 'organization_dialog.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Debug Page'),
        ),
        body: Column(children: <Widget>[
          FlatButton(
            child: const Text('user load'),
            onPressed: () {
              print('pressed user load');
              UserDialog.getUser(context);
            },
          ),
          FlatButton(
            child: const Text('user login'),
            onPressed: () {
              print('pressed user login');
              UserDialog.showLoginDialog(context);
            },
          ),
          FlatButton(
            child: const Text('user update'),
            onPressed: () {
              print('pressed user update');
              UserDialog.showUpdateDialog(context);
            },
          ),
          FlatButton(
            child: const Text('organization create'),
            onPressed: () {
              print('pressed organization create');
              OrganizationDialog.showOrgCreateDialog(context);
            },
          )
        ]));
  }
}