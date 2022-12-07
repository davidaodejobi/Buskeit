// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:buskeit/modules/dashboard/screens/dash_board.dart';
import 'package:buskeit/modules/dashboard/view_model/bus_mgmt_controller.dart';
import 'package:buskeit/modules/dashboard/view_model/individual_veri_provider.dart';
import 'package:buskeit/modules/dashboard/view_model/school_workspace_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:buskeit/modules/auth_flow/view_model/signin_provider.dart';
import 'package:buskeit/modules/dashboard/view_model/dahboard_provider.dart';
import 'package:buskeit/modules/onboarding/view_models/onboarding_provider.dart';

import 'constant/constant.dart';
import 'core/services/api/authentication_api.dart';
import 'core/services/services.dart';
import 'core/utils/theme.dart';
import 'core/utils/token_decode.dart';
import 'locator.dart';
import 'modules/auth_flow/screens/sign_in.dart';
import 'modules/auth_flow/view_model/signup_provider.dart';
import 'modules/dashboard/view_model/settings_provider.dart';
import 'modules/onboarding/onboarding.dart';

StorageService storageService = getIt<StorageService>();
HiveStorageService hiveStorageService = getIt<HiveStorageService>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  String? theToken = await storageService.readItem(key: token);
  bool expired = theToken == null ? true : isTokenExpired(theToken);
  if (expired) {
    storageService.deleteItem(key: token);
  }

  hiveStorageService.readItem(key: onBoarded).then((value) {
    value ??= false;
    runApp(MyApp(
      isOnboarded: value,
      isExpired: expired,
    ));
  });
}

class MyApp extends StatelessWidget {
  final bool isExpired;
  final bool isOnboarded;
  // final bool active;
  const MyApp({
    Key? key,
    required this.isExpired,
    required this.isOnboarded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),
        ChangeNotifierProvider<SigninProvider>(create: (_) => SigninProvider()),
        ChangeNotifierProvider<AuthenticationApiService>(
            create: (_) => AuthenticationApiService()),
        ChangeNotifierProvider<BaseDashboardProvider>(
            create: (_) => BaseDashboardProvider()),
        ChangeNotifierProvider<OnBoardingProvider>(
            create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider<SchoolWorkspaceProvider>(
            create: (_) => SchoolWorkspaceProvider()),
        ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider()),
        ChangeNotifierProvider<BusMgmtProvider>(
            create: (_) => BusMgmtProvider()),
        ChangeNotifierProvider<IndividualVeriProvider>(
            create: (_) => IndividualVeriProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Buskeit',
        theme: AppTheme.light(),
        home: !isOnboarded
            ? Onboarding()
            : isExpired
                ? const SignIn()
                : const BaseDashBoard(),
      ),
    );
  }
}
