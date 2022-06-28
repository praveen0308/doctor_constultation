import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  final _userId = "userID";
  final _roleId = "roleId";
  final _loginStatus = "loginStatus";
  final _userName = "name";
  final _email = "email";
  final _phoneNumber = "phoneNumber";
  final _profileUrl = "profileUrl";

  Future updateUserId(int userId) async {
    var writeData =
        await _storage.write(key: _userId, value: userId.toString());
    return writeData;
  }

  Future<int> getUserId() async {
    var readData = await _storage.read(key: _userId);

    return int.parse(readData ?? "0");
  }

  Future updateUserRoleId(int roleId) async {
    var writeData =
        await _storage.write(key: _roleId, value: roleId.toString());
    return writeData;
  }

  Future<int> getUserRoleId() async {
    var readData = await _storage.read(key: _roleId);

    return int.parse(readData ?? "0");
  }

  Future updateLoginStatus(bool status) async {
    if (status) {
      var writeData =
          await _storage.write(key: _loginStatus, value: "loggedIn");
      return writeData;
    } else {
      var writeData =
          await _storage.write(key: _loginStatus, value: "loggedOut");
      return writeData;
    }
  }

  Future<bool> getLoginStatus() async {
    var readData = await _storage.read(key: _loginStatus);
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
    var writeData = await _storage.write(key: _userName, value: name);
    return writeData;
  }

  Future<String?> getUserName() async {
    var readData = await _storage.read(key: _userName);
    return readData;
  }

  Future updateUserEmail(String name) async {
    var writeData = await _storage.write(key: _email, value: name);
    return writeData;
  }

  Future<String?> getUserEmail() async {
    var readData = await _storage.read(key: _email);
    return readData;
  }

  Future updatePhoneNumber(String name) async {
    var writeData = await _storage.write(key: _phoneNumber, value: name);
    return writeData;
  }

  Future<String?> getPhoneNumber() async {
    var readData = await _storage.read(key: _phoneNumber);
    return readData;
  }

  Future updateUserProfile(String name) async {
    var writeData = await _storage.write(key: _profileUrl, value: name);
    return writeData;
  }

  Future<String?> getUserProfile() async {
    var readData = await _storage.read(key: _profileUrl);
    return readData;
  }
  Future clearStorage() async {
    await _storage.delete(key: _userId);
    await _storage.delete(key: _roleId);
    await _storage.delete(key: _userName);
    await _storage.delete(key: _loginStatus);
    await _storage.delete(key: _email);
    await _storage.delete(key: _phoneNumber);
  }
}
