// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:buskeit/constant/helper/helper.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/shared.dart';
import 'view_model/signup_provider.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const YMargin(10),
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
            const YMargin(20),
            TextFieldWithHeader(
              controller: spCont.emailController,
              title: 'Email',
              hintText: 'You@gmail.com',
            ),
            const YMargin(16),
            TextFieldWithHeader(
              controller: spCont.firstNameController,
              title: 'First name',
              hintText: 'John',
            ),
            const YMargin(16),
            TextFieldWithHeader(
              controller: spCont.emailController,
              title: 'Last name',
              hintText: 'Doe',
            ),
            const YMargin(16),
            TextFieldWithHeader(
              controller: spCont.emailController,
              title: 'Phone number',
              hintText: '+234 123 456 789',
            ),
            const YMargin(16),
            TextFieldWithHeader(
              controller: spCont.emailController,
              title: 'Password',
              hintText: '********',
            ),
            const YMargin(50),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Container(),
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
        ).paddingHorizontal(padding: 16),
      ),
    );
  }
}
