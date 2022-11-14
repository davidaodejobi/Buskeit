import 'package:buskeit/constant/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';
import '../view_model/signup_provider.dart';
import 'verify_email.dart';

class SignUp extends StatelessWidget {
  final String name;
  const SignUp({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spCont = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                controller: spCont.emailController,
                title: 'Email',
                hintText: 'You@gmail.com',
              ),
              const YMargin(16),
              TextFieldWithHeader(
                controller: spCont.emailController,
                title: 'Password',
                hintText: '********',
              ),
              const YMargin(16),
              TextFieldWithHeader(
                controller: spCont.emailController,
                title: 'Confirm Password',
                hintText: '********',
              ),
              const YMargin(20),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerifyEmail(),
                          ),
                        );
                      },
                      child: Text(
                        'Create my account',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.white,
                            ),
                      ))),
              const YMargin(20),
            ],
          ),
          Column(
            children: [
              Text(
                'By signing up you are agreeing to our',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColor.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const YMargin(8),
              InkWell(
                onTap: () {},
                child: Text(
                  'Terms and conditions',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }
}
