import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/login/login_state_controller.dart';
import 'package:shiftend/util/logger.dart';

class OrgSelectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orgs =
        context.select<LoginState, List<Organization>>((state) => state.orgs);
    logger
      ..info('OrgSelectWidget build: orgs.length = ${orgs.length}')
      ..info(
          'OrgSelectWidget build: selectedOrg = ${context.select<LoginState, Organization>((state) => state.selectedOrg)}');
    if (orgs.isEmpty) {
      return const Center();
    }
    return Center(
      child: DropdownButton<Organization>(
        value: context
            .select<LoginState, Organization>((state) => state.selectedOrg),
        onChanged: (newOrg) {
          context.read<LoginStateController>().selectOrg(newOrg);
        },
        items: context.select<LoginState, List<DropdownMenuItem<Organization>>>(
          (state) => state.orgs
              .map<DropdownMenuItem<Organization>>(
                (org) => DropdownMenuItem<Organization>(
                  child: Text(org.id),
                  value: org,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
