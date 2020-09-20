import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'member_detail.dart';
import 'member_provider.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({this.user, this.model});

  final User user;
  final MemberProvider model;

  @override
  Widget build(BuildContext context) {
    final starsItem = <Widget>[];
    for (var i = 0; i < model.level; i++) {
      starsItem.add(
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    }
    return ChangeNotifierProvider<MemberProvider>(
      create: (_) => MemberProvider(),
      child: Column(
        children: <Widget>[
          Consumer<MemberProvider>(builder: (context, model, child) {
            return FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const RoundedRectangleBorder(),
              color: Colors.grey[50],
              padding: const EdgeInsets.all(0),
              onPressed: () async {
                await showDialog<int>(
                  context: context,
                  //barrierDismissible: true,
                  builder: (BuildContext context) {
                    //return MemberLevelDialog(user, model);
                    return MemberDitailPage(user, model);
                  },
                );
              },
              child: Container(
                child: ListTile(
                  dense: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: starsItem,
                  ),
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
                  title: Text(user.name),
                  subtitle: Text(user.role),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
