import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';
import 'user_detail_text.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                ),
                const YMargin(10),
                Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 5,
                        color: Color(0xFFB9D0ED),
                      ),
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/200/300',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const XMargin(20),
            Column(
              children: [
                Container(
                  width: 120,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.greyColor2.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.pen,
                        size: 15,
                      ),
                      const XMargin(10),
                      Text(
                        'Edit Profile',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                const YMargin(10),
                Container(
                  width: 120,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.greyColor2.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.camera,
                        size: 15,
                      ),
                      const XMargin(10),
                      Text(
                        'Upload',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const YMargin(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            UserDetailText(
              title: 'Name',
              value: 'John Doe',
            ),
            UserDetailText(
              title: 'Number:',
              value: '+2347080 262 206',
            ),
            UserDetailText(
              title: 'Gender',
              value: 'Male',
            ),
            UserDetailText(
              title: 'Email address',
              value: 'olaxxx@gmail.com',
            ),
            UserDetailText(
              title: 'Workspace',
              value: 'Juno school space',
            ),
            UserDetailText(
              title: 'Status',
              value: 'Individual',
            ),
          ],
        ),
      ],
    );
  }
}
