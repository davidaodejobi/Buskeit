// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:buskeit/modules/dashboard/widgets/dashboard_card.dart';
import 'package:buskeit/shared/shared.dart';

import 'bus_management.dart';

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
            title: 'Bus Management',
            subtitle: 'Get access to our bus service for your school',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BusManagement()));
            },
          ),
          const YMargin(24),
          DashBoardCard(
            title: 'Staff Vetting',
            subtitle: 'Get access to our vetting service for your school',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Vetting()));
            },
          ),
          const YMargin(24),
          DashBoardCard(
            color: AppColor.greyColor2.withOpacity(0.2),
            title: 'Assignment',
            subtitle:
                'Improve the efficiency of your school by using our assignment service to check the assignment of your students',
            onTap: () {
              infoToast(context, message: 'In Development');
            },
          ),
          const YMargin(24),
          DashBoardCard(
            color: AppColor.greyColor2.withOpacity(0.2),
            title: 'Add a school Admin',
            subtitle: 'Get access to our vetting service for your school',
            onTap: () {
              infoToast(context, message: 'In Development');
            },
          ),
        ],
      ),
    );
  }
}

class Vetting extends StatelessWidget {
  const Vetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vetting'),
      ),
      body: const Center(
        child: Text('Vetting'),
      ),
    );
  }
}
