import 'package:buskeit/constant/constant.dart';
import 'package:buskeit/modules/dashboard/view_model/dahboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../shared/shared.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseDashboardProvider provider =
        Provider.of<BaseDashboardProvider>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/200/300',
                          ),
                        ),
                        const XMargin(16),
                        Text(
                          'Hi John',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ).paddingHorizontal(padding: 16),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    provider.setCurrentIndex(0);
                  },
                  leading: const FaIcon(
                    FontAwesomeIcons.houseLaptop,
                  ),
                  title: Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    provider.setCurrentIndex(1);
                  },
                  leading: const FaIcon(
                    FontAwesomeIcons.servicestack,
                  ),
                  title: Text(
                    'Services',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    provider.setCurrentIndex(2);
                  },
                  leading: const FaIcon(
                    FontAwesomeIcons.tools,
                  ),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    provider.setCurrentIndex(3);
                  },
                  leading: const FaIcon(
                    FontAwesomeIcons.houseLaptop,
                  ),
                  title: Text(
                    'Help',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
            AppBorderButton(
              onTap: () {},
              text: 'Logout',
              width: double.infinity,
            ).paddingAll(padding: 16),
          ],
        ),
      ),
    );
  }
}
