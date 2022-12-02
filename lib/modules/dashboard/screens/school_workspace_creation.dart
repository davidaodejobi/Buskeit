import 'package:flutter/material.dart';

class SchoolWorkspaceCreation extends StatelessWidget {
  const SchoolWorkspaceCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a work space'),
      ),
      body: const Center(
        child: Text('SchoolWorkspaceCreation'),
      ),
    );
  }
}
