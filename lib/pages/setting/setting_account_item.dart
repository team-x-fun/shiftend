import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/user/user_page.dart';

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
          print('「アカウント」を押しました。'),
          print(user),
          Navigator.of(context).push(
            MaterialPageRoute<UserPage>(
              builder: (context) {
                return const UserPage();
              },
            ),
          ),
        },
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
