import 'package:buskeit/constant/helper/helper.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const YMargin(40),
          Text('Dashboard', style: Theme.of(context).textTheme.headline3),
          const YMargin(20),
          Text(
            'Welcome to your dashboard',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppColor.greyColor,
                ),
          ),
          const YMargin(50),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Container(),
                //   ),
                // );
              },
              child: Text(
                'Go to dashboard',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          const YMargin(20),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
