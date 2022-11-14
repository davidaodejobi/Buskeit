import 'package:buskeit/constant/helper/helper.dart';
import 'package:buskeit/modules/auth_flow/view_model/signup_provider.dart';
import 'package:buskeit/modules/dashboard_flow/screens/flow_selection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const YMargin(10),
          Column(
            children: [
              Text(
                'Enter your details',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: AppColor.greyColor,
                    ),
              ),
              const YMargin(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWithHeader(
                    controller: provider.firstNameController,
                    title: 'First Name',
                    hintText: 'John',
                  ),
                  const YMargin(16),
                  TextFieldWithHeader(
                    controller: provider.lastNameController,
                    title: 'Lastname',
                    hintText: 'Doe',
                  ),
                  const YMargin(16),
                  Text(
                    'Gender',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const YMargin(8),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      // color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.greyColor2,
                      ),

                      // boxShadow: [
                      //   BoxShadow(
                      //     color: AppColor.greyColor.withOpacity(0.2),
                      //     blurRadius: 10,
                      //     offset: const Offset(0, 5),
                      //   ),
                      // ],
                    ),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      items: provider.gender
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        print('value: $value');
                      },
                    )),
                  ),
                ],
              ),
              const YMargin(16),
              TextFieldWithHeader(
                controller: provider.phoneNoController,
                title: 'Phone Number',
                hintText: '+23412345678',
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
                            builder: (context) => const FlowSelection(),
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
