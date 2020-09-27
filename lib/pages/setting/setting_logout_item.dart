import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/login/login_state_controller.dart';

class SettingLogoutItem extends StatelessWidget {
  final String detailTitle = 'ログアウト';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () async => {
          await context.read<LoginStateController>().signOut(),
        },
        title: Text(detailTitle),
      ),
    );
  }
}
