import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
