import 'package:flutter/cupertino.dart';

class SignupProvider with ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final List<String> _gender = ['Male', 'Female'];

  List<String> get gender => _gender;
}
