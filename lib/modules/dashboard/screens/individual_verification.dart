import 'package:buskeit/core/services/services.dart';
import 'package:buskeit/modules/dashboard/view_model/individual_veri_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';

HiveStorageService hiveStorageService = getIt<HiveStorageService>();

class IndividualVerification extends StatefulWidget {
  const IndividualVerification({super.key});

  @override
  State<IndividualVerification> createState() => _IndividualVerificationState();
}

class _IndividualVerificationState extends State<IndividualVerification> {
  late TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<IndividualVeriProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const YMargin(40),
          Text('Join workspace', style: Theme.of(context).textTheme.headline3),
          const YMargin(20),
          Text(
            'Please enter the school code sent to your email by the school admin',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppColor.greyColor,
                ),
          ),
          const YMargin(50),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: PinCodeTextField(
              length: 6,
              keyboardType: TextInputType.text,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                activeColor: AppColor.tertiaryColor,
                inactiveColor: AppColor.greyColor,
                selectedFillColor: AppColor.primaryColor.withOpacity(0.1),
                selectedColor: AppColor.primaryColor.withOpacity(0.5),
                inactiveFillColor: Colors.transparent,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: MediaQuery.of(context).size.width * 0.1,
                fieldWidth: MediaQuery.of(context).size.width * 0.1,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
              useHapticFeedback: true,
              enablePinAutofill: true,
              controller: pinController,
              onCompleted: (v) {
                value.join(
                  context: context,
                  workspaceId: pinController.text,
                );
              },
              onChanged: (value) {},
              beforeTextPaste: (text) {
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              appContext: context,
            ),
          ),
          const YMargin(50),
          AppElevatedButton(
            onTap: () {
              value.join(context: context, workspaceId: pinController.text);
            },
            isLoading: value.isLoading,
            text: 'Verify',
          ),
          const YMargin(20),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
