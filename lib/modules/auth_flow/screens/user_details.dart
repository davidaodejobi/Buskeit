// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
              Column(
                children: [
                  TextFieldWithHeader(
                    controller: provider.firstNameController,
                    title: 'First Name',
                    hintText: 'John',
                  ),
                  const YMargin(20),
                  TextFieldWithHeader(
                    controller: provider.lastNameController,
                    title: 'Last Name',
                    hintText: 'Doe',
                  ),
                ],
              ),
              const YMargin(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const YMargin(10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: AppColor.greyColor2,
                        width: 1.0,
                      ),
                    ),
                    child: Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: provider.selectedGender,
                            items: provider.genderOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              provider.onGenderSelect(value!);
                            }),
                      ),
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
              AppElevatedButton(
                onTap: () {
                  if (provider.validateUserDetails(context)) {
                    provider.completeRegistration(context: context);
                  }
                },
                text: 'Complete Registration',
                isLoading: provider.isLoading,
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
