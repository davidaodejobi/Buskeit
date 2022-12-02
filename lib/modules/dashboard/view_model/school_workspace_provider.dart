import 'package:flutter/cupertino.dart';

class SchoolWorkspaceProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();

  clearTextFields() {
    emailController.clear();
    passwordController.clear();
    schoolNameController.clear();
  }
}
