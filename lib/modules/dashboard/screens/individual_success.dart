import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/shared.dart';
import 'dash_board.dart';

class IndividualSuccess extends StatelessWidget {
  const IndividualSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Lottie.asset(
                  'assets/animations/successful.json',
                ),
                Text(
                  'You have successfully joined a school workspace',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            AppElevatedButton(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BaseDashBoard(),
                  ),
                );
              },
              text: 'Go to school Dashboard',
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
