import 'package:buskeit/constant/constant.dart';
import 'package:flutter/material.dart';

class AppBorderButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  const AppBorderButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.greyColor2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppColor.greyColor,
                ),
          ),
        ),
      ),
    );
  }
}
