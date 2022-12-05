// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:buskeit/constant/constant.dart';
import 'package:provider/provider.dart';

import '../../../shared/shared.dart';
import '../../auth_flow/view_model/settings_provider.dart';
import '../widgets/settings_dropdown_button.dart';
import '../widgets/settings_login_status.dart';
import '../widgets/settings_password.dart';
import '../widgets/settings_profile.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              provider.toggleDropdown();
            },
            child: Container(
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
                    provider.settings.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Icon(
                    provider.hasPressed
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: AppColor.greyColor,
                  ),
                ],
              ),
            ),
          ),
          const YMargin(10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
            height: provider.hasPressed ? 45 * 2 : 0,
            child: Container(
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
                    onTap: () {
                      provider.changeSettings(SettingsEnums.profile);
                      provider.toggleDropdown();
                    },
                    title: 'Profile',
                  ),
                  SettingsDropdownButton(
                    onTap: () {
                      provider.changeSettings(SettingsEnums.password);
                      provider.toggleDropdown();
                    },
                    title: 'Password',
                  ),
                ],
              ),
            ),
          ),
          const YMargin(15),
          Expanded(
            child: ListView(
              children: [
                if (provider.settings == SettingsEnums.profile)
                  const SettingsProfile(),
                if (provider.settings == SettingsEnums.password)
                  const SettingsPassword(),
                const LoginStatus(),
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
