import 'package:buskeit/modules/auth_flow/screens/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                    'Remind me',
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
                    provider.signupMock();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyEmail(
                                  email: 'hello',
                                )));
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
