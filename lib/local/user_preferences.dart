import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static setLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loginStatus', status);
  }

  static Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginStatus = prefs.getBool('loginStatus') ?? false;
    return loginStatus;
  }

  static setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString('userName') ?? "";
    return userName;
  }

  static updateEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email') ?? "";
    return email;
  }

  static updateMobileNumber(String mobileNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('mobileNo', mobileNo);
  }

  static Future<String> getMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mobileNo = prefs.getString('mobileNo') ?? "";
    return mobileNo;
  }

  static updateUserRoleId(int roleId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('roleId', roleId);
  }

  static Future<int> getUserRoleId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var roleId = prefs.getInt('roleId') ?? 0;
    return roleId;
  }
}
