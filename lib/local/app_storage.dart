import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future updateUserRoleId(String roleId) async {
    var writeData = await _storage.write(key: "roleId", value: roleId);
    return writeData;
  }

  Future<String?> getUserRoleId() async {
    var readData = await _storage.read(key: "roleId");
    return readData;
  }

  Future updateLoginStatus(String roleId) async {
    var writeData = await _storage.write(key: "roleId", value: roleId);
    return writeData;
  }

  Future<String?> getLoginStatus() async {
    var readData = await _storage.read(key: "roleId");
    return readData;
  }

  Future updateUserName(String name) async {
    var writeData = await _storage.write(key: "name", value: name);
    return writeData;
  }

  Future<String?> getUserName() async {
    var readData = await _storage.read(key: "name");
    return readData;
  }

  Future clearStorage() async {
    await _storage.delete(key: "roleId");
    await _storage.delete(key: "name");
  }
}
