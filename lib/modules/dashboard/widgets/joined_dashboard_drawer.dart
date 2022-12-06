import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';
import '../view_model/dahboard_provider.dart';

class JoinedDashboardDrawer extends StatelessWidget {
  const JoinedDashboardDrawer({
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
                    // Navigator.pop(context);
                    // provider.setCurrentIndex(0);
                    provider.toggleDashboard();
                  },
                  trailing: Icon(
                    provider.dashboard
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: AppColor.greyColor,
                  ),
                  leading: SvgPicture.asset(
                    'assets/svgs/dashboard.svg',
                  ),
                  title: Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                if (provider.dashboard)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            provider.setCurrentIndex(0);
                          },
                          leading: SvgPicture.asset(
                            'assets/svgs/dashboard.svg',
                          ),
                          title: Text(
                            'St. Mary\'s College',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            provider.setCurrentIndex(4);
                          },
                          leading: SvgPicture.asset(
                            'assets/svgs/dashboard.svg',
                          ),
                          title: Text(
                            'Create/Join a Workspace',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    provider.setCurrentIndex(1);
                  },
                  leading: SvgPicture.asset(
                    'assets/svgs/services.svg',
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
                  leading: SvgPicture.asset(
                    'assets/svgs/settings.svg',
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
                  leading: SvgPicture.asset(
                    'assets/svgs/help.svg',
                  ),
                  title: Text(
                    'Help',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
            AppBorderButton(
              onTap: () {
                provider.logout(context);
              },
              text: 'Logout',
              width: double.infinity,
            ).paddingAll(padding: 16),
          ],
        ),
      ),
    );
  }
}
