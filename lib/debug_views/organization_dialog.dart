import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

import 'globals.dart';

class OrganizationDialog {
  static void showOrgCreateDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String id;
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
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  static void showOrgGetDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String id;
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('組織取得ダイアログ'),
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
            child: const Text('取得'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _getOrganization(context, id);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  static void showOrgUpdateDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String id;
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('組織更新ダイアログ'),
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Organization update',
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
            child: const Text('更新(定休日の追加)'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _addHoliday(context, id);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  static void showOrgsGetDialog(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('組織取得ダイアログ'),
        content: Text(firebaseUser.email + 'でログインしています'),
        actions: <Widget>[
          FlatButton(
            child: Text(firebaseUser.email + 'の所有する組織の取得'),
            onPressed: () {
              _getOrganizations(context);
              Navigator.pop(context);
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
        defaultHolidays: <Holiday>[
          Holiday(dayOfWeek: 0, nWeek: 0),
          Holiday(dayOfWeek: 1, nWeek: 1),
          Holiday(dayOfWeek: 1, nWeek: 3)
        ],
      );
      await orgRepo.create(org);
    } catch (e) {
      print('組織の作成に失敗しました．');
    }
  }

  static Future _getOrganization(BuildContext context, String id) async {
    Organization org;
    try {
      org = await orgRepo.getOrganization(id);
      print(org.toJson().toString());
    } catch (e) {
      print('組織の取得に失敗しました．');
    }
  }

  static Future _addHoliday(BuildContext context, String id) async {
    Organization org;
    try {
      org = await orgRepo.getOrganization(id);
      var holidays = org.defaultHolidays;
      holidays.add(Holiday(dayOfWeek: 1, nWeek: 0));
      org = org.copyWith(defaultHolidays: holidays);
      await orgRepo.update(org);
    } catch (e) {
      print('組織の更新に失敗しました．');
    }
  }

  static Future _getOrganizations(BuildContext context) async {
    List<Organization> org;
    User user = await userRepo.getCurrentUser();
    try {
      org = await orgRepo.getOrganizations(user.id);
      print(org);
    } catch (e) {
      print('自分がオーナー組織の取得に失敗しました．');
    }
  }
}