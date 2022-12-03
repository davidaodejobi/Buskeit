// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/dashboard/screens/individual_verification.dart';
import 'package:buskeit/modules/dashboard/screens/school_workspace_creation.dart';
import 'package:buskeit/modules/dashboard/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

import 'package:buskeit/shared/shared.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: ListView(
        children: [
          DashBoardCard(
            title: 'Bus Service',
            subtitle: 'Get access to our bus service for your school',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchoolWorkspaceCreation()));
            },
          ),
          const YMargin(24),
          DashBoardCard(
            title: 'Vetting Service',
            subtitle: 'Get access to our vetting service for your school',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndividualVerification()));
            },
          ),
          const YMargin(24),
          DashBoardCard(
            title: 'Add a school Admin',
            subtitle: 'Get access to our vetting service for your school',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndividualVerification()));
            },
          ),
        ],
      ),
    );
  }
}
