// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/shared/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:buskeit/modules/auth_flow/screens/sign_in.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';
import '../view_model/signup_provider.dart';
import '../widgets/bottom_verify.dart';
import '../widgets/save_password_button.dart';

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
              Row(
                children: [
                  SavePasswordButton(
                    savePassword: provider.savePassword,
                    onTap: (() {
                      provider.toggleSavePassword();
                    }),
                  ),
                ],
              ),
              const YMargin(30),
              AppElevatedButton(
                isLoading: false,
                text: 'Sign up',
                onTap: () {},
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
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
