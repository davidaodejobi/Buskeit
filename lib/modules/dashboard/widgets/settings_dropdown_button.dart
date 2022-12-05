import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class SettingsDropdownButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const SettingsDropdownButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 45,
          width: double.infinity,
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
              const YMargin(45),
            ],
          ),
        ),
      ),
    );
  }
}
