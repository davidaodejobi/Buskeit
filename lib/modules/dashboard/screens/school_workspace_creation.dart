// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:buskeit/modules/dashboard/view_model/school_workspace_provider.dart';
import 'package:buskeit/shared/shared.dart';

import '../../../constant/constant.dart';
import '../../../shared/app_border_button.dart';

class SchoolWorkspaceCreation extends StatelessWidget {
  const SchoolWorkspaceCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SchoolWorkspaceProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const YMargin(0),
          Column(
            children: [
              const YMargin(10),
              const YMargin(35),
              Text(
                'Create work space',
                style: Theme.of(context).textTheme.headline3,
              ),
              const YMargin(30),
              TextFieldWithHeader(
                controller: provider.emailController,
                title: 'Enter your email',
                hintText: 'You@gmail.com',
              ),
              const YMargin(25),
              TextFieldWithHeader(
                controller: provider.passwordController,
                title: 'Password',
                hintText: '********',
              ),
              const YMargin(10),
              TextFieldWithHeader(
                controller: provider.passwordController,
                title: 'Password',
                hintText: '********',
              ),
              const YMargin(40),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBorderButton(
                width: MediaQuery.of(context).size.width * 0.3,
                text: 'Clear',
                onTap: () {},
              ),
              AppElevatedButton(
                width: MediaQuery.of(context).size.width * 0.3,
                isLoading: false,
                text: 'Next',
                onTap: () {},
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
