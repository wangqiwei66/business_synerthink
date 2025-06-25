// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:tiny_weight/app/models/user_info/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedInfo {
  static const String key_userinfo = 'key_userinfo';
  static const String key_homeModel = 'key_homeModel';
  static const String key_access_token = 'key_access_token';
  static const String key_refresh_token = 'key_refresh_token';
  static const String key_expires_time = 'key_expires_time';

  static const String key_isTest = 'key_isTest';
  static const String key_phone = 'key_phone';
  static const String key_uid = 'key_uid'; // 添加 uid 的 key
  static const String key_offline_security_checks =
      'key_offline_security_checks';
  static const String key_qingduanshiRead = 'key_qingduanshiRead';

  UserInfo? _userInfo;
  String? _accessToken;
  String? _refreshToken;
  String? _uid; // 添加 uid 缓存
  int? _expiresTime;
  bool? _isTest;
  String? _email;
  List<dynamic>? _offlineSecurityChecks;
  bool? _qingduanshiRead;

  Future<SharedPreferences> get _sharedPref async =>
      await SharedPreferences.getInstance();

  Future<void> setUserInfo(UserInfo? userInfo) async {
    final prefs = await _sharedPref;
    if (userInfo != null) {
      await prefs.setString(key_userinfo,
          jsonEncode(userInfo.toJson())); // ✅ 确保 UserInfo 有 `toJson()`
    } else {
      await prefs.remove(key_userinfo); // ✅ 清除数据
    }
    _userInfo = userInfo;
  }

  Future<UserInfo?> get userInfo async {
    if (_userInfo != null) return _userInfo;

    var data = (await _sharedPref).getString(key_userinfo);
    if (data != null && data != 'null') {
      return UserInfo.fromJson(jsonDecode(data));
    }
    return null;
  }

  set accessToken(value) {
    ((value) async {
      final prefs = await _sharedPref;
      await prefs.setString(key_access_token, value);
    })(value);
    _accessToken = value;
  }

  Future<String?> get accessToken async {
    return _accessToken ??
        (await _sharedPref).get(key_access_token) as FutureOr<String?>;
  }

  set expiresTime(value) {
    ((value) async {
      final prefs = await _sharedPref;
      await prefs.setInt(key_expires_time, value);
    })(value);
    _expiresTime = value;
  }

  Future<int?> get expiresTime async {
    return _expiresTime ??
        (await _sharedPref).get(key_expires_time) as FutureOr<int?>;
  }

  set phone(value) {
    ((value) async {
      final prefs = await _sharedPref;
      await prefs.setString(key_phone, value);
    })(value);
    _email = value;
  }

  Future<String?> get phone async {
    return _email ?? (await _sharedPref).get(key_phone) as FutureOr<String?>;
  }

  set refreshtoken(value) {
    ((value) async {
      final prefs = await _sharedPref;
      await prefs.setString(key_refresh_token, value);
    })(value);
    _refreshToken = value;
  }

  Future<String?> get refreshtoken async {
    return _refreshToken ??
        (await _sharedPref).get(key_refresh_token) as FutureOr<String?>;
  }

  set isTest(value) {
    ((value) async {
      final prefs = await _sharedPref;
      await prefs.setBool(key_isTest, value);
    })(value);
    _isTest = value;
  }

  Future<bool> get isTest async {
    return _isTest ?? (await _sharedPref).getBool(key_isTest) ?? true;
  }

  /// 添加离线安检数据
  Future<bool> addOfflineSecurityCheck(Map<String, dynamic> data) async {
    try {
      final prefs = await _sharedPref;
      List<dynamic> existingData = await getOfflineSecurityChecks();
      existingData.add(data);
      _offlineSecurityChecks = existingData;
      return await prefs.setString(
          key_offline_security_checks, jsonEncode(existingData));
    } catch (e) {
      print('保存离线安检数据失败: $e');
      return false;
    }
  }

  /// 获取所有离线安检数据
  Future<List<dynamic>> getOfflineSecurityChecks() async {
    if (_offlineSecurityChecks != null) {
      return _offlineSecurityChecks!;
    }

    final prefs = await _sharedPref;
    String? jsonString = prefs.getString(key_offline_security_checks);
    if (jsonString == null) {
      return [];
    }

    _offlineSecurityChecks = jsonDecode(jsonString);
    return _offlineSecurityChecks!;
  }

  /// 清除离线安检数据
  Future<bool> clearOfflineSecurityChecks() async {
    final prefs = await _sharedPref;
    _offlineSecurityChecks = null;
    return await prefs.remove(key_offline_security_checks);
  }

  clean() async {
    final prefs = await _sharedPref;
    prefs.remove(key_userinfo);
    prefs.remove(key_access_token);
    prefs.remove(key_offline_security_checks);
  }

  cleanAll() async {
    final prefs = await _sharedPref;
    prefs.clear();
  }

  // 添加 uid 的 setter
  set uid(value) {
    ((value) async {
      final prefs = await _sharedPref;
      await prefs.setString(key_uid, value);
    })(value);
    _uid = value;
  }

  // 添加 uid 的 getter
  Future<String?> get uid async {
    return _uid ?? (await _sharedPref).getString(key_uid);
  }

  set qingduanshiRead(bool? value) {
    ((value) async {
      final prefs = await _sharedPref;
      if (value != null) {
        await prefs.setBool(key_qingduanshiRead, value);
      } else {
        await prefs.remove(key_qingduanshiRead);
      }
    })(value);
    _qingduanshiRead = value;
  }

  // ✅ 改名为 fetchQingduanshiRead 或 getQingduanshiRead
  Future<bool> fetchQingduanshiRead() async {
    return _qingduanshiRead ??
        (await _sharedPref).getBool(key_qingduanshiRead) ??
        false;
  }
}
