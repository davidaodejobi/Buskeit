import 'package:get_it/get_it.dart';

import 'core/core.dart';

GetIt getIt = GetIt.I;

setup() {
  //View Model

  // Services
  // getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<HiveStorageService>(() => HiveStorageService());
}
