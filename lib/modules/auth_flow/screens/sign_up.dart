import 'package:buskeit/constant/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';
import '../view_model/signup_provider.dart';

class SignUp extends StatelessWidget {
  final String name;
  const SignUp({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const YMargin(0),
          Column(
            children: [
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headline3,
              ),
              const YMargin(10),
              Text(
                'Enter your email and create a password',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: AppColor.greyColor,
                    ),
              ),
              const YMargin(30),
              TextFieldWithHeader(
                controller: provider.emailController,
                title: 'Email',
                hintText: 'You@gmail.com',
              ),
              const YMargin(16),
              TextFieldWithHeader(
                controller: provider.passwordController,
                title: 'Password',
                hintText: '********',
              ),
              const YMargin(16),
              TextFieldWithHeader(
                controller: provider.passwordCController,
                title: 'Confirm Password',
                hintText: '********',
              ),
              const YMargin(20),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (provider.validatePassword(context)) {
                          provider.signup(context: context);
                        }
                      },
                      child: provider.isLoading
                          ? Lottie.asset(
                              'assets/animations/loading.json',
                            )
                          : Text(
                              'Create my account',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ))),
              const YMargin(20),
            ],
          ),
          // Column(
          //   children: [
          //     Text(
          //       'By signing up you are agreeing to our',
          //       style: Theme.of(context).textTheme.headline6!.copyWith(
          //             color: AppColor.greyColor,
          //             fontWeight: FontWeight.w500,
          //           ),
          //     ),
          //     const YMargin(8),
          //     InkWell(
          //       onTap: () {},
          //       child: Text(
          //         'Terms and conditions',
          //         style: Theme.of(context).textTheme.headline6!.copyWith(
          //               fontWeight: FontWeight.w500,
          //               color: AppColor.primaryColor,
          //             ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ).paddingSymmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }
}

class z {}
