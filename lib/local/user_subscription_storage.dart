import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSubscriptionStorage {
  final _storage = const FlutterSecureStorage();

  final _planId = "planId";
  final _planName = "subscriptionPlanName";
  final _expiryDate = "expiryDate";
  final _balanceVisit = "balanceVisit";
  final _lastPurchased = "lastPurchased";

  Future updatePlanId(int id) async {
    var writeData = await _storage.write(key: _planId, value: id.toString());
    return writeData;
  }

  Future<int> getUserPlanId() async {
    var readData = await _storage.read(key: _planId);

    return int.parse(readData ?? "0");
  }

  Future updatePlanName(String name) async {
    var writeData =
        await _storage.write(key: _planName, value: name.toString());
    return writeData;
  }

  Future<String> getPlanName() async {
    var readData = await _storage.read(key: _planName);
    return readData ?? "_";
  }

  Future updatePlanExpiry(String date) async {
    var writeData =
        await _storage.write(key: _expiryDate, value: date.toString());
    return writeData;
  }

  Future<String> getPlanExpiry() async {
    var readData = await _storage.read(key: _expiryDate);
    return readData ?? "";
  }

  Future updateBalance(String name) async {
    var writeData =
        await _storage.write(key: _balanceVisit, value: name.toString());
    return writeData;
  }

  Future<int> getBalanceVisits() async {
    var readData = await _storage.read(key: _balanceVisit);
    return int.parse(readData ?? "0");
  }

  Future updateLastPurchased(String date) async {
    var writeData =
        await _storage.write(key: _lastPurchased, value: date.toString());
    return writeData;
  }

  Future<String> getLastPurchased() async {
    var readData = await _storage.read(key: _lastPurchased);
    return readData ?? "";
  }
}
