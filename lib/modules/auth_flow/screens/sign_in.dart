// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/constant/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                  title: 'Confirm password',
                  hintText: '********',
                ),
                const YMargin(10),
                //remind me button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SignIn(),
                        //   ),
                        // );
                      },
                      child: Text(
                        'Forgot password?',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.secondaryColor,
                            ),
                      ),
                    ),
                  ],
                ),

                const YMargin(50),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (provider.validatePassword(context)) {
                      //   verificationModal(context);
                      // }
                    },
                    child: provider.isLoading
                        ? const SpinKitChasingDots(
                            color: Colors.white,
                            size: 30,
                          )
                        : Text(
                            'Sign in',
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
