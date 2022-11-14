import 'package:get_it/get_it.dart';

import 'core/services/storage.service.dart';

GetIt getIt = GetIt.I;

setup() {
  //View Model

  // Services
  // getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
}
