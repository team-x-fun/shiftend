import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/user/user_page.dart';
import 'package:shiftend/pages/user/user_state.dart';
import 'package:shiftend/pages/user/user_state_controller.dart';
import 'package:shiftend/util/logger.dart';

class SettingAccountItem extends StatelessWidget {
  const SettingAccountItem();

  @override
  Widget build(BuildContext context) {
    final User user =
        Provider.of<LoginState>(context, listen: true).currentUser;
    return Container(
      child: ListTile(
        dense: true,
        trailing: const Icon(Icons.keyboard_arrow_right),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(user.iconUrl),
            ),
          ),
        ),
        onTap: () => {
          logger.info('「アカウント」を押しました。'),
          logger.info(user),
          Navigator.push<UserPage>(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  StateNotifierProvider<UserStateController, UserState>(
                      create: (context) => UserStateController(),
                      child: const UserPage()),
            ),
          )
        },
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
