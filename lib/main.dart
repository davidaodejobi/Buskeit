import 'package:buskeit/modules/auth_flow/view_models/user_details_provider.dart';
import 'package:buskeit/modules/sign_in/view_model/welcome_provider.dart';
import 'package:buskeit/modules/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'core/utils/theme.dart';
import 'modules/auth_flow/view_models/signup_provider.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),
        ChangeNotifierProvider<SigninProvider>(create: (_) => SigninProvider()),
        ChangeNotifierProvider<UserDetailsProvider>(
            create: (_) => UserDetailsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Buskeit',
        theme: AppTheme.light(),
        home: const SignIn(),
      ),
    );
  }
}
