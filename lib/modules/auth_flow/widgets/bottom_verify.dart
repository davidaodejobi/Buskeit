import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_color.dart';
import '../../../shared/shared.dart';
import '../view_model/signup_provider.dart';

class BottomVerify extends StatefulWidget {
  const BottomVerify({super.key});

  @override
  State<BottomVerify> createState() => _BottomVerifyState();
}

class _BottomVerifyState extends State<BottomVerify> {
  late TextEditingController _pinController;

  @override
  void initState() {
    _pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Verfiy your account',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        const YMargin(40),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'A verification code was sent to\n',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColor.greyColor,
                    ),
              ),
              TextSpan(
                text: provider.emailController.text,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColor.greyColor2,
                    ),
              ),
            ],
          ),
        ),
        const YMargin(30),
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
            controller: _pinController,
            onCompleted: (v) {
              provider.verify(
                context: context,
                code: _pinController.text,
              );
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
        AppElevatedButton(
          onTap: () {
            provider.verify(
              context: context,
              code: _pinController.text,
            );
          },
          text: 'Verify',
          isLoading: provider.isLoading,
        ),
        const YMargin(20),
      ],
    );
  }
}
