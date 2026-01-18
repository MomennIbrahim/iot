import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCache {
  static AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  static IOSOptions getIosOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  static late FlutterSecureStorage flutterSecureStorage;
  static secureCacheInit() {
    flutterSecureStorage = FlutterSecureStorage(
      aOptions: getAndroidOptions(),
      iOptions: getIosOptions(),
    );
  }

  static Future<void> setData({
    required String key,
    required dynamic value,
  }) async {
    return await flutterSecureStorage.write(
      key: key,
      value: value.toString(),
      iOptions: const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }

  static Future getData({required String key}) async {
    return await flutterSecureStorage.read(key: key);
  }

  static Future<bool?> getBoolData({required String key}) async {
    final value = await flutterSecureStorage.read(key: key);
    if (value == null) return null;
    return value == 'true';
  }

  static Future removeData({required String key}) async {
    return await flutterSecureStorage.delete(key: key);
  }
}
