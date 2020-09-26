import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';

class DefaultPersonnelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultPersonnel = context.select<LoginState, Personnel>(
        (state) => state.selectedOrg.defaultPersonnel);
    return Column(
      children: <Widget>[
        Container(
          child: const Text(
            '基本要員',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListTile(
          title: Text('必要人員 ${defaultPersonnel.number}'),
        ),
        ListTile(
          title: Text('必要総合レベル ${defaultPersonnel.totalLevel}'),
        ),
      ],
    );
  }
}
