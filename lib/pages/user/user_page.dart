import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/pages/login/login_state.dart';

class UserPage extends StatelessWidget {
  const UserPage();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginState>(context, listen: true).currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        title: const Text(
          'ユーザページ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
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
              Text('name: ${user.name}'),
              Text('email: ${user.email}'),
              Text('role: ${user.role}'),
              Text('level: ${user.role}')
            ],
          ),
        ),
      ),
    );
  }
}
