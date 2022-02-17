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
}
