// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:buskeit/constant/helper/helper.dart';
import 'package:provider/provider.dart';

import '../../../../../constant/constant.dart';
import '../../../../../shared/shared.dart';
import '../view_model/signup_provider.dart';

class VerifyEmail extends StatelessWidget {
  final String email;
  const VerifyEmail({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const YMargin(40),
          Text('Verification code',
              style: Theme.of(context).textTheme.headline3),
          const YMargin(20),
          Text(
            'Please type the verification code sent to $email',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppColor.greyColor,
                ),
          ),
          const YMargin(50),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: PinCodeTextField(
              length: 4,
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
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
              useHapticFeedback: true,
              enablePinAutofill: true,
              controller: provider.verifyController,
              onCompleted: (v) {
                provider.verify(context: context);
              },
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
                provider.verify(context: context);
              },
              child: provider.isLoading
                  ? Lottie.asset(
                      'assets/animations/loading.json',
                    )
                  : Text(
                      'Verify',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                          ),
                    ),
            ),
          ),
          const YMargin(20),
        ],
      ).paddingHorizontal(
        padding: 16,
      ),
    );
  }
}
