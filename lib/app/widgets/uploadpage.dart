// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tiny_weight/app/widgets/toast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpdaterPage extends StatefulWidget {
  final Widget child;

  const UpdaterPage(this.child);

  @override
  UpdatePagerState createState() => UpdatePagerState();
}

class UpdatePagerState extends State<UpdaterPage> {
  // ignore: prefer_typing_uninitialized_variables
  var _lowestVersionName, _latestReleasedVersion, _detailsUrl, _detailText;

  @override
  void initState() {
    super.initState();
    //每次開啟APP獲取當前時間戳
    //獲取"Later"儲存的時間戳
    //  (Constants.timeStart);
    // if (timeStart == 0) {
    //   //第一次開啟APP時執行"版本更新"的網路請求
    //   _getNewVersionAPP();
    // } else if (timeStart != 0 && timeEnd - timeStart >= 24 * 60 * 60 * 1000) {
    //如果新舊時間戳的差大於或等於一天，執行網路請求
    _getNewVersionAPP();
    // }
  }

  //執行版本更新的網路請求
  _getNewVersionAPP() async {
//     LoginApiService().getUpdateVersion().then((value) {
//       if (value != null) {
//         var data = value;
// //最新版本號
//         _lowestVersionName =
//             data["lowestSupportedVersion"].toString(); //最低支援的版本號
//         _latestReleasedVersion = data["latestReleasedVersion"].toString();
//         _detailsUrl = data["detailsUrl"].toString(); //更新說明頁面
//         _detailText = data['details'].toString();
//         _checkVersionCode();
//         if (mounted) {
//           setState(() {});
//         }
//       }
//     });
  }

  //檢查版本更新的版本號
  _checkVersionCode() async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String currentVersionCode = packageInfo.version;

    // if (await compareVersion(_lowestVersionName, currentVersionCode)) {
    //   _showNewVersionAppDialog(); //彈出對話方塊
    // } else if (await compareVersion(
    //     _latestReleasedVersion, currentVersionCode)) {
    //   _showNewVersionAppDialogNoCommit();
    // }
  }

  // 版本號對比
  Future<bool> compareVersion(curV, reqV) async {
    if (curV != null && reqV != null) {
      //將兩個版本號拆成數字
      var arr1 = curV.split('.'), arr2 = reqV.split('.');
      int arr1Len = arr1.length;
      int arr2Len = arr2.length;
      int minLength = min(arr1Len, arr2Len), position = 0, diff = 0;
      // 依次比較版本號每一位大小，當對比得出結果後跳出迴圈（後文有簡單介紹）
      while (position < minLength &&
          ((diff = int.parse(arr1[position]) - int.parse(arr2[position])) ==
              0)) {
        position++;
      }
      diff = (diff != 0) ? diff : (arr1.length - arr2.length);
      //若curV大於reqV，則返回true
      return diff > 0;
    } else {
      //輸入為空
      print("版本號不能為空");
      return false;
    }
  }

  //彈出"版本更新"對話方塊
  Future<void> _showNewVersionAppDialog() async {
    showPermissionAlert(
      context,
      _detailText ?? '',
      // '為了給您更好的使用者體驗, 請升級app至最新版本'.tr,
      () async {
        launchUrlString(
          _detailsUrl,
          mode: LaunchMode.externalApplication,
        );
      },
      okText: '去升級'.tr,
    );
  }

  //彈出"版本更新"對話方塊(非強制更新)
  Future<void> _showNewVersionAppDialogNoCommit() async {
    showConfirmDialogOld(
      context,

      _detailText ?? '',
      // '為了給您更好的使用者體驗, 請升級app至最新版本'.tr,
      () async {
        launchUrlString(
          _detailsUrl,
          mode: LaunchMode.externalApplication,
        );
      },
      okText: '去升級'.tr,
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
