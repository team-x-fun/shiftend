import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

import 'globals.dart';

class OrganizationDialog {
  static void showOrgCreateDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String id, name;
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('組織作成ダイアログ'),
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Organization id',
                ),
                onSaved: (String value) {
                  id = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
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
            child: const Text('作成'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _createOrganization(context, id);
              }
            },
          )
        ],
      ),
    );
  }

  static Future _createOrganization(BuildContext context, String id) async {
    Organization org;
    User user = await userRepo.getCurrentUser();
    try {
      org = Organization(
        id: id,
        ownerIds: <String>[user.id],
        memberIds: <String>[user.id],
        defaltHolidays: <Holiday>[
          Holiday(id: '1', dayOfWeek: 0, nWeek: 0),
          Holiday(id: '2', dayOfWeek: 1, nWeek: 1),
          Holiday(id: '3', dayOfWeek: 1, nWeek: 3)
        ],
      );
      await orgRepo.create(org);
      Navigator.pop(context);
    } catch (e) {
      print('組織の作成に失敗しました．');
    }
  }
}
