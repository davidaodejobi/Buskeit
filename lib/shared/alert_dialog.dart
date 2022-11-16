import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showAlertDialog({required BuildContext context, required String message}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Lottie.asset(
        'assets/animations/error-purple.json',
        height: 100,
        width: 100,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Ok',
              style: Theme.of(context).textTheme.headline5,
            )),
      ],
    ),
  );
}
