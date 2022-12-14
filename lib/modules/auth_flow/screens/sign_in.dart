// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/shared.dart';
import '../view_model/signin_provider.dart';
import '../widgets/save_password_button.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                  'Sign in to Buskeit',
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
                const YMargin(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SavePasswordButton(
                      savePassword: provider.savePassword,
                      onTap: (() {
                        provider.toggleSavePassword();
                      }),
                    ),
                  ],
                ),
                const YMargin(50),
                AppElevatedButton(
                  onTap: () {
                    if (provider.validateSignin(context)) {
                      provider.login(context: context);
                    }
                  },
                  text: 'Sign in',
                  isLoading: provider.isLoading,
                ),
                const YMargin(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account yet?',
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
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up',
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
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
