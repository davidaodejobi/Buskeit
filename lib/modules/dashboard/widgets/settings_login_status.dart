import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

class LoginStatus extends StatelessWidget {
  const LoginStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            'We will alert you via olaxxx@gmasil.com if there is an unusaul activity in your account',
            style: Theme.of(context).textTheme.headline6,
          ),
          const YMargin(20),
          for (int i = 0; i < 5; i++) const SettingsLoginStatus(),
        ],
      ),
    );
  }
}

class SettingsLoginStatus extends StatelessWidget {
  const SettingsLoginStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const XMargin(15),
            const FaIcon(
              FontAwesomeIcons.laptop,
              color: AppColor.greyColor,
            ),
            const XMargin(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2018 Macbook pro 15 inch',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const YMargin(10),
                Text(
                  'Lagos, Nigeria \u2022 22 Sept. 2019 at 4:30pm',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      // fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
          child: Divider(),
        )
      ],
    );
  }
}
