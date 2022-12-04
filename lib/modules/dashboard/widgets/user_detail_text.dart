import 'package:flutter/material.dart';

class UserDetailText extends StatelessWidget {
  final String title;
  final String value;
  const UserDetailText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: Theme.of(context).textTheme.headline6,
          ),
          TextSpan(
            text: '$value\n',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
