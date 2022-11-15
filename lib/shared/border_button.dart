import 'package:flutter/material.dart';

import '../constant/constant.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const BorderButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.tertiaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(text, style: Theme.of(context).textTheme.headline5!),
        ),
      ),
    );
  }
}
