import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';

import 'globals.dart';

class ShiftDialog {
  static void showShiftCreateDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String orgId;
    Shift shift = const Shift();
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('シフト作成ダイアログ'),
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
                  orgId = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'User id',
                ),
                onSaved: (String value) {
                  shift = shift.copyWith(userId: value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Start Time',
                ),
                onSaved: (String value) {
                  final DateTime start = DateTime.parse(value);
                  shift = shift.copyWith(start: start);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'End Time',
                ),
                onSaved: (String value) {
                  final DateTime end = DateTime.parse(value);
                  shift = shift.copyWith(end: end);
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
                shiftRepo.create(orgId, shift);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  static void showShiftUpdateDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String orgId;
    Shift shift = const Shift();
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('シフト更新ダイアログ'),
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
                  orgId = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'User id',
                ),
                onSaved: (String value) {
                  shift = shift.copyWith(userId: value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Start Time',
                ),
                onSaved: (String value) {
                  final DateTime start = DateTime.parse(value);
                  shift = shift.copyWith(start: start);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'End Time',
                ),
                onSaved: (String value) {
                  final DateTime end = DateTime.parse(value);
                  shift = shift.copyWith(end: end);
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
            child: const Text('更新'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                shiftRepo.update(orgId, shift);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  static void showShiftDeleteDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String orgId;
    DateTime day;
    String userId;
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('シフト情報取得ダイアログ'),
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
                  orgId = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'user id',
                ),
                onSaved: (String value) {
                  userId = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Day',
                ),
                onSaved: (String value) {
                  day = DateTime.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              )
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
            child: const Text('削除'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                shiftRepo.delete(orgId, day, userId);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  static void showShiftListGetDialog(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String orgId;
    DateTime month;
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('シフト情報取得ダイアログ'),
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
                  orgId = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Month',
                ),
                onSaved: (String value) {
                  month = DateTime.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'IDは必須入力項目です．';
                  }
                  return null;
                },
              )
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
            child: const Text('取得'),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                final shifts = await shiftRepo.getShifts(orgId, month);
                print(shifts);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
