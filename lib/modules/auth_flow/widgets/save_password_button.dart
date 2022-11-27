import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

class SavePasswordButton extends StatelessWidget {
  final bool savePassword;
  final VoidCallback onTap;
  const SavePasswordButton({
    Key? key,
    required this.savePassword,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color:
                  savePassword ? AppColor.secondaryColor : AppColor.greyColor2,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: savePassword
                ? const Icon(
                    Icons.check,
                    size: 15,
                    color: Colors.white,
                  )
                : const SizedBox.shrink(),
          ),
          const XMargin(10),
          Text(
            'Remember me',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
