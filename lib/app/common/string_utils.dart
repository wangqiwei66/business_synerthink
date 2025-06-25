// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StringUtil {
  // 郵箱判斷
  static bool isEmail(String? input) {
    String regexEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (input == null || input.isEmpty) return false;
    return RegExp(regexEmail).hasMatch(input);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    String chinaPhoneNumberPattern = r'^[1][3-9]\d{9}$';
    String hongKongPhoneNumberPattern = r'^852[69]\d{7}$';

    RegExp chinaPhoneRegExp = RegExp(chinaPhoneNumberPattern);
    RegExp hongKongPhoneRegExp = RegExp(hongKongPhoneNumberPattern);

    return chinaPhoneRegExp.hasMatch(phoneNumber);
  }

  //帶有首行縮排的Json格式
  static JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  /// 單純的Json格式輸出列印
  static void printJson(Object object) {
    try {
      var encoderString = encoder.convert(object);
      debugPrint(encoderString);
    } catch (e) {
      print(e);
    }
  }

  static String convertToLocalTime(String utcTime) {
    // 解析输入的时间字符串，假设输入格式为 "yyyy-MM-dd HH:mm:ss"
    DateTime utcDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(utcTime);

    // 打印解析后的UTC时间
    print('Parsed utcDateTime: $utcDateTime');

    // 直接在UTC时间上增加8小时
    DateTime localDateTime = utcDateTime.add(const Duration(hours: 8));

    // 打印增加8小时后的本地时间
    print('localDateTime after adding 8 hours: $localDateTime');

    // 创建格式化器
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    // 将本地时间格式化为字符串
    String localTime = formatter.format(localDateTime);

    return localTime;
  }

  // 純數字
  static const String digitRegex = r"^[0-9]*$";

  // 含有數字
  static const String containDigitRegex = ".*[0-9].*";

  // 純字母
  static const String letterRegex = "[a-zA-Z]+";

  // 包含字母
  static const String smallContainLetterRegex = ".*[a-z].*";

  // 包含字母
  static const String bigContainLetterRegex = ".*[A-Z].*";

  // 包含字母
  static const String containLetterRegex = ".*[a-zA-Z].*";

  // 純中文
  static const String chineseRegex = "[\u4e00-\u9fa5]";

  // 僅僅包含字母和數字
  static const String letterDigitRegex = "^[a-z0-9A-Z]+\$";
  static const String chineseLetterRegex = "([\u4e00-\u9fa5]+|[a-zA-Z]+)";
  static const String chineseLetterDigitRegex = "^[a-z0-9A-Z\u4e00-\u9fa5]+\$";

  // 純數字
  static bool isOnlyNumber(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(digitRegex).hasMatch(input);
  }

  // 含有數字
  static bool hasDigit(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(containDigitRegex).hasMatch(input);
  }

  // 是否包含中文
  static bool isChinese(String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(chineseRegex).hasMatch(input);
  }

  /// 千分
  String getFormatStepCount(int stepCount) {
    if (stepCount < 1000) {
      return stepCount.toString();
    }
    var format = NumberFormat('0,000');
    return format.format(stepCount);
  }
}
