// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/constant/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_color.dart';
import '../../../shared/shared.dart';
import '../view_model/signin_provider.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              YMargin(MediaQuery.of(context).size.height * 0.1),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/hello.png',
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const YMargin(16),
                    Text(
                      'Welcome',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      'To keep connected with us, please login with your login details',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const YMargin(40),
                    TextFieldWithHeader(
                      controller: provider.emailController,
                      title: 'Email',
                      hintText: 'You@gmail.com',
                    ),
                    const YMargin(20),
                    TextFieldWithHeader(
                      controller: provider.passwordController,
                      title: 'Password',
                      hintText: '********',
                    ),
                    const YMargin(16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            provider.login(
                              email: provider.emailController.text,
                              password: provider.passwordController.text,
                              context: context,
                            );
                          },
                          child: provider.isLoading
                              ? Lottie.asset(
                                  'assets/animations/loading.json',
                                )
                              : Text(
                                  'Log in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white),
                                )),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: Theme.of(context).textButtonTheme.style!.copyWith(
                      overlayColor: MaterialStateProperty.all(
                          AppColor.tertiaryColor.withOpacity(0.2)),
                    ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColor.greyColor,
                        ),
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColor.primaryColor,
                        ),
                  ),
                ])),
              ),
            ],
          ),
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
