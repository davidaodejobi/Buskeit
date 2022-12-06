import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

class DashboardHeaderCard extends StatelessWidget {
  const DashboardHeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      // width: 100,
      decoration: const BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back,',
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 16,
              ),
            ),
            const YMargin(10),
            const Text(
              'Mr. John Doe',
              style: TextStyle(
                // color: AppColor.blackColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const YMargin(10),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Thnak you for joining ',
                    style: TextStyle(
                      color: AppColor.greyColor,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: 'St. Mary\'s College ',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'School Workspace',
                    style: TextStyle(
                      color: AppColor.greyColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
