import 'package:buskeit/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constant/constant.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';
import 'dash_board.dart';

HiveStorageService hiveStorageService = getIt<HiveStorageService>();

class IndividualVerification extends StatelessWidget {
  const IndividualVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const YMargin(40),
          Text('Join workspace', style: Theme.of(context).textTheme.headline3),
          const YMargin(20),
          Text(
            'Please enter the school verification sent to your email by the school admin',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppColor.greyColor,
                ),
          ),
          const YMargin(50),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: PinCodeTextField(
              length: 6,
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                activeColor: AppColor.tertiaryColor,
                inactiveColor: AppColor.greyColor,
                selectedFillColor: AppColor.primaryColor.withOpacity(0.1),
                selectedColor: AppColor.primaryColor.withOpacity(0.5),
                inactiveFillColor: Colors.transparent,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: MediaQuery.of(context).size.width * 0.1,
                fieldWidth: MediaQuery.of(context).size.width * 0.1,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
              useHapticFeedback: true,
              enablePinAutofill: true,
              controller: TextEditingController(),
              onCompleted: (v) {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              appContext: context,
            ),
          ),
          const YMargin(50),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndividualSuccess(),
                  ),
                );
              },
              child: Text(
                'Verify',
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

class IndividualSuccess extends StatelessWidget {
  const IndividualSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Lottie.asset(
                  'assets/animations/successful.json',
                ),
                Text(
                  'You have successfully joined a school workspace',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            AppElevatedButton(
              onTap: () {
                hiveStorageService.storeItem(
                    key: hasJoinedWorkspace, value: true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BaseDashBoard(),
                  ),
                );
              },
              text: 'Go to school Dashboard',
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
