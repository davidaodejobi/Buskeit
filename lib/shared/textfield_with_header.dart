import 'package:buskeit/shared/shared.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class TextFieldWithHeader extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType? keyboardType;
  const TextFieldWithHeader({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const YMargin(10),
        TextField(
          textInputAction: TextInputAction.next,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: title == 'Password' || title == 'Confirm password',
          style: Theme.of(context).textTheme.headline6,
          // fillColor: focusNode.hasFocus ? Colors.white : Colors.transparent,
          decoration: InputDecoration(
            isDense: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.greyColor2,
                width: 1,
              ),
            ),
            focusColor: AppColor.greyColor2,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.secondaryColor,
                width: 1,
              ),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
