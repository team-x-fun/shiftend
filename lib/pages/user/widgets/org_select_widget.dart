import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/login/login_state_controller.dart';

class OrgSelectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Organization>(
        value: Provider.of<LoginState>(context, listen: true).selectedOrg,
        onChanged: (newOrg) {
          Provider.of<LoginStateController>(context, listen: false)
              .selectOrg(newOrg);
        },
        items: Provider.of<LoginState>(context)
            .orgs
            .map<DropdownMenuItem<Organization>>((Organization org) {
          return DropdownMenuItem<Organization>(
            child: Text(org.id),
            value: org,
          );
        }).toList(),
      ),
    );
  }
}
