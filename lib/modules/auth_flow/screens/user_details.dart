// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/dashboard/screens/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:buskeit/modules/auth_flow/view_model/signup_provider.dart';

import '../../../constant/constant.dart';
import '../../../shared/shared.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: ListView(
        children: [
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
                'Complete your profile',
                style: Theme.of(context).textTheme.headline3,
              ),
              const YMargin(40),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        TextFieldWithHeader(
                          controller: provider.firstNameController,
                          title: 'First Name',
                          hintText: 'John',
                        ),
                        const YMargin(20),
                        TextFieldWithHeader(
                          controller: provider.lastNameController,
                          title: 'Lastname',
                          hintText: 'Doe',
                        ),
                      ],
                    ),
                  ),
                  const XMargin(20),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const YMargin(10),
                        SizedBox(
                          height: 142,
                          width: double.infinity,
                          child: Column(
                            children: [
                              const YMargin(10),
                              Expanded(
                                child: GenderButton(
                                  onPressed: (() {
                                    provider.selectGender('Male');
                                  }),
                                  bgColor: !provider.maleButton
                                      ? Colors.transparent
                                      : AppColor.secondaryColor,
                                  borderColor: provider.maleButton
                                      ? Colors.transparent
                                      : AppColor.greyColor2,
                                  text: 'Male',
                                  textColor: provider.maleButton
                                      ? Colors.white
                                      : AppColor.greyColor2,
                                ),
                              ),
                              const YMargin(20),
                              Expanded(
                                child: GenderButton(
                                  onPressed: (() {
                                    provider.selectGender('Female');
                                  }),
                                  bgColor: !provider.femaleButton
                                      ? Colors.transparent
                                      : AppColor.secondaryColor,
                                  borderColor: provider.femaleButton
                                      ? Colors.transparent
                                      : AppColor.greyColor2,
                                  text: 'Female',
                                  textColor: provider.femaleButton
                                      ? Colors.white
                                      : AppColor.greyColor2,
                                ),
                              ),
                              const YMargin(10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const YMargin(20),
              TextFieldWithHeader(
                keyboardType: TextInputType.number,
                controller: provider.phoneNumberController,
                title: 'Phone Number',
                hintText: '+23412345678',
              ),
              const YMargin(30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (provider.validate(context)) {
                      // provider.nextPage();
                      // provider.completeRegistration(context: context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashBoard(),
                        ),
                      );
                    }
                  },
                  child: provider.isLoading
                      ? const SpinKitChasingDots(
                          color: Colors.white,
                          size: 30,
                        )
                      : Text(
                          'Complete Registration',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                ),
              ),
              const YMargin(20),
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
          ),
        ],
      ).paddingSymmetric(
        horizontal: 16,
        vertical: 16,
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  const GenderButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: textColor,
                ),
          ),
        ),
      ),
    );
  }
}
