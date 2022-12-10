import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../constant/constant.dart';

void errorToast(BuildContext context, {required String message}) {
  return showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.error(
      backgroundColor: AppColor.accentColor,
      message: message,
    ),
  );
}

void successToast(BuildContext context, {required String message}) {
  return showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.success(
      message: message,
    ),
  );
}

void infoToast(BuildContext context, {required String message}) {
  return showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.info(
      backgroundColor: AppColor.tertiaryColor,
      message: message,
    ),
  );
}
