import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'member_detail.dart';
import 'member_provider.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({
    this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Consumer<MemberProvider>(builder: (context, memberProvider, child) {
          return FlatButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: const RoundedRectangleBorder(),
            color: Colors.grey[50],
            padding: const EdgeInsets.all(0),
            onPressed: () async {
              await showDialog<int>(
                context: context,
                builder: (BuildContext context) {
                  return MemberDetailPage(user, memberProvider);
                },
              );
            },
            child: Container(
              child: ListTile(
                dense: true,
                trailing: SmoothStarRating(
                    allowHalfRating: false,
                    starCount: 5,
                    rating: memberProvider.level,
                    size: 25,
                    isReadOnly: true,
                    color: Colors.orange,
                    borderColor: Colors.orange,
                    spacing: 0),
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
    );
  }
}
