import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  static final storage = FlutterSecureStorage(aOptions: AndroidOptions());

  static Future<void> saveAccessToken(String accessToken) async {
    await storage.write(key: "accessToken", value: accessToken);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await storage.write(key: "refreshToken", value: refreshToken);
  }

  static Future<String?> getAccessToken() async {
    return await storage.read(key: "accessToken");
  }

  static Future<String?> getRefreshToken() async {
    return await storage.read(key: "refreshToken");
  }

  static Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
