import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class SettingsPassword extends StatelessWidget {
  const SettingsPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
        ),
        Text(
          'Please enter your current password to change password',
          style: Theme.of(context).textTheme.headline6,
        ),
        const YMargin(20),
        TextFieldWithHeader(
          controller: TextEditingController(),
          title: 'Current password',
          hintText: '********',
        ),
        const YMargin(25),
        TextFieldWithHeader(
          controller: TextEditingController(),
          title: 'New password',
          hintText: '********',
        ),
        const YMargin(25),
        TextFieldWithHeader(
          controller: TextEditingController(),
          title: 'Confirm new password',
          hintText: '********',
        ),
        const YMargin(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBorderButton(
              width: MediaQuery.of(context).size.width * 0.3,
              text: 'Clear',
              onTap: () {},
            ),
            AppElevatedButton(
              width: MediaQuery.of(context).size.width * 0.3,
              isLoading: false,
              text: 'Update',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
