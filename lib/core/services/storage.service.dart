import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoggedIn = false;

  void storeItem({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<dynamic> readItem({required String key}) async {
    final value = await storage.read(key: key);
    return value;
  }

  void deleteItem({required String key}) async {
    await storage.delete(key: key);
  }

  void deleteAllItems() async {
    await storage.deleteAll();
  }
}
