import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:tiny_weight/app/common/shared_info.dart';
import 'package:tiny_weight/app/common/sp.dart';
import 'package:tiny_weight/app/config/locale.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/models/base_logic.dart';
import 'package:tiny_weight/app/pages/ai_search_view.dart';
import 'package:tiny_weight/app/pages/mall_view.dart';
import 'package:tiny_weight/app/pages/setting_view.dart';

class SellerMainLogic extends BaseLogic {
  int currentIndex = 0;
  bool isTest = false;
  bool isReload = false;

  var homepageWidgets = <Widget>[
    MallView(),
    const Center(
      child: Text(
        '活動頁面\n盡請期待',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ),
    AiSearchView(),
    const Center(
      child: Text(
        '組織頁面\n盡請期待',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    ),
    SettingView()
  ];

  var homepageTabItems = [
    BottomNavigationBarItem(
      icon: Image.asset(
        '${base_img_path}mall_icon.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      activeIcon: Image.asset(
        '${base_img_path}mall_icon_pressed.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      label: '商城'.tr,
    ),
    BottomNavigationBarItem(
      // icon: const Icon(Icons.access_time),
      icon: Image.asset(
        '${base_img_path}activity_icon.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      activeIcon: Image.asset(
        '${base_img_path}activity_icon_pressed.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      label: '活動'.tr,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        '${base_img_path}icon_transparent.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      activeIcon: Image.asset(
        '${base_img_path}icon_transparent.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      label: '', //'扫一扫'.tr,
    ),
    BottomNavigationBarItem(
      // icon: const Icon(Icons.access_time),
      icon: Image.asset(
        '${base_img_path}organize_icon.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      activeIcon: Image.asset(
        '${base_img_path}organize_icon_pressed.png',
        fit: BoxFit.fill,
        height: 25,
        width: 25,
      ),
      label: '組織'.tr,
    ),
    BottomNavigationBarItem(
      // icon: const Icon(Icons.access_time),
      icon: Image.asset(
        '${base_img_path}setting_icon.png',
        fit: BoxFit.fill,
        height: 25,
        // width: 30,
      ),
      activeIcon: Image.asset(
        '${base_img_path}setting_icon_pressed.png',
        fit: BoxFit.fill,
        height: 25,
        // width: 30,
      ),

      label: '設置'.tr,
    ),
  ];

  @override
  void onReady() {
    currentIndex = 0;
    super.onReady();
  }

  ///預留自動切換語言
  getLoc() {
    final locale = SpUtil().getJSON(
      'kSelectLocale',
    );
    if (locale == LocaleKey.us) {
      KLocale().changeLocale(key: LocaleKey.us);
    }

    // Locale? thisLocale=Get.deviceLocale;
    // if(){

    // }
  }

  refreshToken() async {
    String? token = await SharedInfo().accessToken;
    String? refreshtoken = await SharedInfo().refreshtoken;

    Map<String, dynamic> payload = Jwt.parseJwt(token ?? '');
    int day = 0;
    try {
      day = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000)
          .difference(DateTime.now())
          .inDays;
    } catch (e) {
      day = 0;
    }

    if (day <= 15) {
      // await LoginApiService()
      //     .refreshToken(accessToken: token, refreshToken: refreshtoken);
    }

    // UserInfo? userInfo = await SharedInfo().userInfo;
  }

  getService() async {
    isTest = await SharedInfo().isTest;
  }

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    update();
  }
}
