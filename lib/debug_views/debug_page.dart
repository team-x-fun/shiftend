import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/debug_views/shift_dialog.dart';
import 'package:shiftend/debug_views/user_dialog.dart';
import 'package:shiftend/util/logger.dart';

import 'organization_dialog.dart';
import 'test_data.dart';

class DebugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final testdata = TestData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Page'),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: const Text('test data作成'),
            onPressed: () {
              logger.info('pressed test data');
              testdata.insert();
              logger.info('done insert test data');
            },
          ),
          FlatButton(
            child: const Text('user load'),
            onPressed: () {
              logger.info('pressed user load');
              UserDialog.getUser(context);
            },
          ),
          FlatButton(
            child: const Text('user login'),
            onPressed: () {
              logger.info('pressed user login');
              UserDialog.showLoginDialog(context);
            },
          ),
          FlatButton(
            child: const Text('user update'),
            onPressed: () {
              logger.info('pressed user update');
              UserDialog.showUpdateDialog(context);
            },
          ),
          FlatButton(
            child: const Text('organization create'),
            onPressed: () {
              logger.info('pressed organization create');
              OrganizationDialog.showOrgCreateDialog(context);
            },
          ),
          FlatButton(
            child: const Text('organization get'),
            onPressed: () {
              logger.info('pressed organization get');
              OrganizationDialog.showOrgGetDialog(context);
            },
          ),
          FlatButton(
            child: const Text('organizations get'),
            onPressed: () {
              logger.info('pressed organizations get');
              OrganizationDialog.showOrgsGetDialog(context);
            },
          ),
          FlatButton(
            child: const Text('organizations update(定休日の追加)'),
            onPressed: () {
              logger.info('pressed organizations update');
              OrganizationDialog.showOrgUpdateDialog(context);
            },
          ),
          FlatButton(
            child: const Text('shift create'),
            onPressed: () {
              logger.info('pressed shift create');
              ShiftDialog.showShiftCreateDialog(context);
            },
          ),
          FlatButton(
            child: const Text('shift update'),
            onPressed: () {
              logger.info('pressed shift update');
              ShiftDialog.showShiftUpdateDialog(context);
            },
          ),
          FlatButton(
            child: const Text('shift delete'),
            onPressed: () {
              logger.info('pressed shift delete');
              ShiftDialog.showShiftDeleteDialog(context);
            },
          ),
          FlatButton(
            child: const Text('shift list get'),
            onPressed: () {
              logger.info('pressed shift list get');
              ShiftDialog.showShiftListGetDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
