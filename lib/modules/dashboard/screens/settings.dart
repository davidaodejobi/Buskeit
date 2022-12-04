// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:buskeit/constant/constant.dart';
import 'package:buskeit/shared/margin.dart';

import '../widgets/settings_dropdown_button.dart';
import '../widgets/settings_login_status.dart';
import '../widgets/settings_profile.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: AppColor.greyColor2.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.greyColor,
                ),
              ],
            ),
          ),
          const YMargin(10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: AppColor.greyColor2.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                SettingsDropdownButton(
                  onTap: () {},
                  title: 'Profile',
                ),
                SettingsDropdownButton(
                  onTap: () {},
                  title: 'Password',
                ),
                SettingsDropdownButton(
                  onTap: () {},
                  title: 'Language',
                ),
              ],
            ),
          ),
          const YMargin(15),
          Expanded(
            child: ListView(
              children: [
                const SettingsProfile(),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const YMargin(20),
                      Text(
                        'Where you are logged in',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const YMargin(10),
                      Text(
                        'We will alert you via olaxxx@gmail.com if there is an unusaul activity in your account',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const YMargin(20),
                      for (int i = 0; i < 5; i++) const SettingsLoginStatus(),
                    ],
                  ),
                ),
                const YMargin(20),
              ],
            ),
          ),
        ],
      ).paddingLTRB(
        top: 16,
        right: 16,
        left: 16,
      ),
    );
  }
}
