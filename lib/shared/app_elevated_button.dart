// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isLoading;
  final double width;
  const AppElevatedButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.isLoading,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        child: isLoading
            ? const SpinKitChasingDots(
                color: Colors.white,
                size: 30,
              )
            : Text(
                text,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}
