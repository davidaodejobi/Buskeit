import 'package:buskeit/shared/shared.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class TextFieldWithHeader extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  const TextFieldWithHeader({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const YMargin(8),
        TextField(
          textInputAction: TextInputAction.next,
          controller: controller,
          style: Theme.of(context).textTheme.headline6,
          // fillColor: focusNode.hasFocus ? Colors.white : Colors.transparent,
          decoration: InputDecoration(
            isDense: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.greyColor,
                width: 1,
              ),
            ),
            focusColor: AppColor.greyColor,
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
