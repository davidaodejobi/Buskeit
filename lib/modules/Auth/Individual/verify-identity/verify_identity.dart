// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:buskeit/constant/constant.dart';
import 'package:buskeit/constant/helper/helper.dart';
import 'package:buskeit/shared/margin.dart';

class VerifyIdentity extends StatelessWidget {
  const VerifyIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Identity'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Verify your identity',
            style: Theme.of(context).textTheme.headline3,
          ),
          Column(
            children: [
              IdentityVerificationCard(
                title: 'Use your NIN/BVN',
                subtitle:
                    'Verfify your account using your national identification number (NIN)',
                child: const Icon(
                  Icons.person,
                  size: 30,
                ),
                onTap: () {},
              ),
              const YMargin(20),
              IdentityVerificationCard(
                title: 'Use your NIN/BVN',
                subtitle:
                    'Verfify your account using your national identification number (NIN)',
                child: const Icon(
                  Icons.person,
                  size: 30,
                ),
                onTap: () {},
              ),
              const YMargin(20),
              IdentityVerificationCard(
                title: 'Use your NIN/BVN',
                subtitle:
                    'Verfify your account using your national identification number (NIN)',
                child: const Icon(
                  Icons.person,
                  size: 30,
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyIdentity(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ).paddingLTRB(top: 30, bottom: 40),
    );
  }
}

class IdentityVerificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback onTap;
  const IdentityVerificationCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.greyColor2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            child,
            const XMargin(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor,
                        ),
                  ),
                  const YMargin(10),
                  Text(
                    subtitle,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColor.greyColor,
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
