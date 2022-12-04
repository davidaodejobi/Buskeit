// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/dashboard/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';
import '../view_model/dahboard_provider.dart';
import '../widgets/dashboard_drawer.dart';

StorageService storageService = getIt<StorageService>();

class BaseDashBoard extends StatelessWidget {
  const BaseDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.bell,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              provider.setHasWorkSpace();
            },
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const DashboardDrawer(),
      // body: const Dashboard(),
      // body: const Services(),
      body: const Settings(),
    );
  }
}

class DashboardHeaderCard extends StatelessWidget {
  const DashboardHeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      // width: 100,
      decoration: const BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.greyColor.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome back,',
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 16,
              ),
            ),
            YMargin(10),
            Text(
              'John Doe',
              style: TextStyle(
                // color: AppColor.blackColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            YMargin(10),
            Text(
              'Select a flow to continue',
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
