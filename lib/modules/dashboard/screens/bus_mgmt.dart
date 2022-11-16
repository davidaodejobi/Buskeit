import 'package:flutter/material.dart';

class BusMgmt extends StatelessWidget {
  const BusMgmt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Management'),
      ),
      body: Column(
        children: const [
          Text('Bus Management'),
        ],
      ),
    );
  }
}
