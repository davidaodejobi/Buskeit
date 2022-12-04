import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

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
