// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/dashboard/screens/individual_verification.dart';
import 'package:buskeit/modules/dashboard/screens/school_workspace_creation.dart';
import 'package:buskeit/modules/dashboard/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

import 'package:buskeit/shared/shared.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: ListView(
        children: [
          DashBoardCard(
            title: 'Create a work space',
            subtitle: 'Tap to create a new work space',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SchoolWorkspaceCreation()));
            },
          ),
          const YMargin(24),
          DashBoardCard(
            title: 'Join a work space',
            subtitle: 'Tap to join a work space',
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
