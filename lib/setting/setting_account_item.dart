import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingAccountItem extends StatelessWidget {
  final String nameLabel;
  final String mailLabel;
  final String iconUrl;
  SettingAccountItem(this.nameLabel, this.mailLabel, this.iconUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        trailing: Icon(Icons.keyboard_arrow_right),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(iconUrl),
            ),
          ),
        ),
        title: Text(
          nameLabel,
        ),
        subtitle: Text(mailLabel),
      ),
    );
  }
}
