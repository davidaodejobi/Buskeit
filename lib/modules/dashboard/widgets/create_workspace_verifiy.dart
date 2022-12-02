import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constant/app_color.dart';
import '../../../shared/shared.dart';

class CreateWorkspaceVerify extends StatefulWidget {
  const CreateWorkspaceVerify({super.key});

  @override
  State<CreateWorkspaceVerify> createState() => _CreateWorkspaceVerifyState();
}

class _CreateWorkspaceVerifyState extends State<CreateWorkspaceVerify> {
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
    // final provider = Provider.of<SignupProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Join workspace',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        const YMargin(40),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Please input the invitation code sent to your email Obxxx@gmail.com',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColor.greyColor,
                    ),
              ),
              TextSpan(
                text: 'widget.email',
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
            horizontal: 16,
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
            controller: _pinController,
            // onCompleted: (v) {
            //   provider.verify(context: context);
            // },
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
          isLoading: false,
          onTap: () {
            Navigator.pop(context);
          },
          text: 'Verify',
        ),
        const YMargin(20),
      ],
    );
  }
}
