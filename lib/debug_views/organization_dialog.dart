import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/util/logger.dart';

import 'globals.dart';

class OrganizationDialog {
  static void showOrgCreateDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String id;
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('組織作成ダイアログ'),
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
        title: const Text('組織取得ダイアログ'),
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
        title: const Text('組織更新ダイアログ'),
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
        title: const Text('組織取得ダイアログ'),
        content: Text('${firebaseUser.email}でログインしています'),
        actions: <Widget>[
          FlatButton(
            child: Text('${firebaseUser.email}の所有する組織の取得'),
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
    final User user = await userRepo.getCurrentUser();
    try {
      org = Organization(
        id: id,
        owners: <User>[user],
        members: <Member>[
          Member(
            level: 1,
            role: 'owner',
            user: user,
          ),
        ],
        defaultHolidays: <Holiday>[
          const Holiday(dayOfWeek: 0, nWeek: 0),
          const Holiday(dayOfWeek: 1, nWeek: 1),
          const Holiday(dayOfWeek: 1, nWeek: 3)
        ],
      );
      await orgRepo.create(org);
    } on Exception {
      logger.shout('組織の作成に失敗しました．');
    }
  }

  static Future _getOrganization(BuildContext context, String id) async {
    Organization org;
    try {
      org = await orgRepo.getOrganization(id);
      logger.info(org.toJson().toString());
    } on Exception {
      logger.shout('組織の取得に失敗しました．');
    }
  }

  static Future _addHoliday(BuildContext context, String id) async {
    Organization org;
    try {
      org = await orgRepo.getOrganization(id);
      final holidays = org.defaultHolidays
        ..add(const Holiday(dayOfWeek: 1, nWeek: 0));
      org = org.copyWith(defaultHolidays: holidays);
      await orgRepo.update(org);
    } on Exception {
      logger.shout('組織の更新に失敗しました．');
    }
  }

  static Future _getOrganizations(BuildContext context) async {
    List<Organization> org;
    final User user = await userRepo.getCurrentUser();
    try {
      org = await orgRepo.getOrganizations(user.id);
      logger.info(org);
    } on Exception {
      logger.shout('自分がオーナー組織の取得に失敗しました．');
    }
  }
}
