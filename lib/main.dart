// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/dashboard/screens/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:buskeit/modules/auth_flow/screens/sign_in.dart';
import 'package:buskeit/modules/auth_flow/view_model/signin_provider.dart';

import 'constant/constant.dart';
import 'core/services/services.dart';
import 'core/utils/theme.dart';
import 'core/utils/token_decode.dart';
import 'locator.dart';
import 'modules/auth_flow/view_model/signup_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  StorageService storageService = getIt<StorageService>();
  String? theToken = await storageService.readItem(key: token);
  bool expired = theToken == null ? true : isTokenExpired(theToken);
  if (expired) {
    storageService.deleteItem(key: token);
  }
  runApp(MyApp(
    isExpired: expired,
  ));
}

class MyApp extends StatelessWidget {
  final bool isExpired;
  // final bool active;
  const MyApp({
    Key? key,
    required this.isExpired,
    // required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),
        ChangeNotifierProvider<SigninProvider>(create: (_) => SigninProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Buskeit',
        theme: AppTheme.light(),
        home: isExpired ? const SignIn() : const DashBoard(),
      ),
    );
  }
}
