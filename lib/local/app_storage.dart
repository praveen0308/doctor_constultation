import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future updateUserRoleId(int roleId) async {
    var writeData =
        await _storage.write(key: "roleId", value: roleId.toString());
    return writeData;
  }

  Future<int> getUserRoleId() async {
    var readData = await _storage.read(key: "roleId");

    return int.parse(readData ?? "0");
  }

  Future updateLoginStatus(bool status) async {
    if (status) {
      var writeData =
          await _storage.write(key: "loginStatus", value: "loggedIn");
      return writeData;
    } else {
      var writeData =
          await _storage.write(key: "loginStatus", value: "loggedOut");
      return writeData;
    }
  }

  Future<bool> getLoginStatus() async {
    var readData = await _storage.read(key: "loginStatus");
    if (readData != null) {
      if (readData == "loggedIn") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future updateUserName(String name) async {
    var writeData = await _storage.write(key: "name", value: name);
    return writeData;
  }

  Future<String?> getUserName() async {
    var readData = await _storage.read(key: "name");
    return readData;
  }

  Future updateUserEmail(String name) async {
    var writeData = await _storage.write(key: "email", value: name);
    return writeData;
  }

  Future<String?> getUserEmail() async {
    var readData = await _storage.read(key: "email");
    return readData;
  }

  Future updatePhoneNumber(String name) async {
    var writeData = await _storage.write(key: "email", value: name);
    return writeData;
  }

  Future<String?> getPhoneNumber() async {
    var readData = await _storage.read(key: "email");
    return readData;
  }

  Future clearStorage() async {
    await _storage.delete(key: "roleId");
    await _storage.delete(key: "name");
  }
}
