import 'package:buskeit/modules/auth_flow/screens/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';
import '../view_model/signup_provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Scaffold(
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const YMargin(0),
          Column(
            children: [
              const YMargin(10),
              Text(
                'Buskeit',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: AppColor.secondaryColor,
                    ),
              ),
              const YMargin(35),
              Text(
                'Sign up to Buskeit',
                style: Theme.of(context).textTheme.headline3,
              ),
              const YMargin(30),
              TextFieldWithHeader(
                controller: provider.emailController,
                title: 'Email',
                hintText: 'You@gmail.com',
              ),
              const YMargin(25),
              TextFieldWithHeader(
                controller: provider.passwordController,
                title: 'Password',
                hintText: '********',
              ),
              const YMargin(25),
              TextFieldWithHeader(
                controller: provider.passwordCController,
                title: 'Confirm password',
                hintText: '********',
              ),
              const YMargin(10),
              //remind me button
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
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

              const YMargin(30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // if (provider.validatePassword(context)) {
                    //   provider.signup(context: context);
                    // }
                    verificationModal(context);
                    // provider.signupMock();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const VerifyEmail(
                    //               email: 'hello',
                    //             )));
                  },
                  child: provider.isLoading
                      ? const SpinKitChasingDots(
                          color: Colors.white,
                          size: 30,
                        )
                      : Text(
                          'Create account',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                ),
              ),
              const YMargin(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor,
                        ),
                  ),
                  const XMargin(10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.secondaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // ),
        ],
      ).paddingSymmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }
}

Future<dynamic> verificationModal(BuildContext context) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      //TODO: change to false
      // isDismissible: false,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: const BottomVerify(),
        );
      });
}

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
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                        ),
                  ),
          ),
        ),
        const YMargin(20),
      ],
    );
  }
}
