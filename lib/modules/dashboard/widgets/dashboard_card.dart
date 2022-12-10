// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:buskeit/constant/constant.dart';
import 'package:buskeit/shared/margin.dart';

class DashBoardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color color;
  const DashBoardCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.greyColor.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/svgs/add-home.svg',
              ),
            ),
            const YMargin(10),
            Text(
              title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const YMargin(10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: AppColor.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
