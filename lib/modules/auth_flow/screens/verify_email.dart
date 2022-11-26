// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/auth_flow/screens/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:provider/provider.dart';

import '../../../../../constant/constant.dart';
import '../../../../../shared/shared.dart';
import '../view_model/signup_provider.dart';

class VerifyEmail extends StatefulWidget {
  final String email;
  const VerifyEmail({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
      ),
      body: ListView(
        children: [
          const YMargin(10),
          Column(
            children: [
              Text(
                'Buskeit',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: AppColor.secondaryColor,
                    ),
              ),
              const YMargin(35),
              Text(
                'Verfiy your account',
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
                      text: widget.email,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColor.greyColor2,
                          ),
                    )
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
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // provider.verify(context: context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserDetails(),
                      ),
                    );
                  },
                  child: provider.isLoading
                      ? const SpinKitChasingDots(
                          color: Colors.white,
                          size: 30,
                        )
                      : Text(
                          'Verify',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                ),
              ),
              const YMargin(20),
            ],
          ),
        ],
      ).paddingHorizontal(
        padding: 16,
      ),
    );
  }
}
