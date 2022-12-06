// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:buskeit/main.dart';
import 'package:buskeit/modules/dashboard/screens/dashboard.dart';
import 'package:buskeit/modules/dashboard/screens/services/services.dart';
import 'package:buskeit/modules/dashboard/screens/settings.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';
import '../view_model/dahboard_provider.dart';
import '../widgets/dashboard_drawer.dart';
import '../widgets/joined_dashboard.dart';
import '../widgets/joined_dashboard_drawer.dart';

StorageService storageService = getIt<StorageService>();

class BaseDashBoard extends StatefulWidget {
  const BaseDashBoard({Key? key}) : super(key: key);

  @override
  State<BaseDashBoard> createState() => _BaseDashBoardState();
}

class _BaseDashBoardState extends State<BaseDashBoard> {
  bool hasJoined = false;

  @override
  void initState() {
    hiveStorageService.readItem(key: hasJoinedWorkspace).then((value) {
      setState(() {
        value == null ? hasJoined = false : hasJoined = value as bool;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BaseDashboardProvider>(context);
    final List<Widget> screens = [
      hasJoined ? const JoinedDashBoard() : const Dashboard(),
      const Services(),
      const Settings(),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/helpdesk.json',
          ),
          Text(
            'Help Desk',
            style: Theme.of(context).textTheme.headline4,
          ),
          const YMargin(16),
          Text(
            'You can ask your questions here, but it is still under development',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ).paddingAll(),
      const Dashboard()
    ];
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
      drawer:
          hasJoined ? const JoinedDashboardDrawer() : const DashboardDrawer(),
      // body: const Dashboard(),
      // body: const Services(),
      body: screens[provider.currentIndex],
    );
  }
}
