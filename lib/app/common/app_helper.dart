import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiny_weight/app/common/shared_info.dart';
import 'package:tiny_weight/app/common/webview/content_webview.dart';
import 'package:tiny_weight/app/pages/common/scan_code_view.dart';
import 'package:tiny_weight/app/pages/common/signature_page.dart';
import 'package:tiny_weight/app/pages/login_view.dart';
import 'package:tiny_weight/app/pages/main_view.dart';
import 'package:tiny_weight/app/service/api_service.dart';
import 'package:tiny_weight/app/models/user_info/user_info.dart';
import 'package:tiny_weight/app/widgets/toast.dart';
import 'dart:async';

class AppHelper {
  static Future<void> checkLogin(VoidCallback func) async {
    UserInfo? info = await SharedInfo().userInfo;
    if (info == null) {
      Get.to(() => const LoginViewPage(), transition: Transition.downToUp);
    } else {
      func();
    }
  }

  //判断是否有权限
  static void checkPermission(Permission permission) async {
    PermissionStatus status = await permission.status;
    print('检测权限$status');
    if (status.isGranted) {
      //权限通过
    } else if (status.isDenied) {
      //权限拒绝， 需要区分IOS和Android，二者不一样
      requestPermission(permission);
    } else if (status.isPermanentlyDenied) {
      //权限永久拒绝，且不在提示，需要进入设置界面
      // openAppSettings();
      requestPermission(permission);
    } else if (status.isRestricted) {
      //活动限制（例如，设置了家长///控件，仅在iOS以上受支持。
      // openAppSettings();
      requestPermission(permission);
    } else {
      //第一次申请
      requestPermission(permission);
    }
  }

  //申请权限
  static void requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    print('权限状态$status');
    if (!status.isGranted) {
      //apple 不允许直接跳 appsettings.
      // openAppSettings();
      showConfirm(permission);
    }
  }

  static void showConfirm(Permission permission) {
    var content = '';
    if (permission == Permission.locationWhenInUse ||
        permission == Permission.locationAlways) {
      content = '我們需要使用您的位置來提供更好的服務。請允許我們訪問您的位置資訊.';
    } else if (permission == Permission.storage) {
      content = '我們需要使用您的儲存空間來儲存檔案。請允許我們存取您的儲存空間.';
    } else if (permission == Permission.camera) {
      content = '我們需要使用您的相機來拍照。請允許我們使用您的相機.';
    }
    showConfirmDialogOld(Get.context!, content, () {
      openAppSettings();
    }, okText: '前往設定'.tr, cancelText: '取消'.tr);
  }
  //切换系统

  static void switchEnv() async {
    bool isTest = await SharedInfo().isTest;
    showConfirmDialogOld(
      Get.context!,
      '${'切換為'.tr}${isTest ? '正常系統'.tr : '預演系統'.tr}?\n\n${'當前'.tr}: ${isTest ? '預演系統'.tr : '正常系統'.tr} \n',
      () async {
        Get.reloadAll(force: true);
        SharedInfo().clean();
        SharedInfo().isTest = !isTest;
        await ApiService.init();
        ApiService().clean();
        SharedInfo().clean();
        Get.offAll(() => const MainPage(), transition: Transition.downToUp);
      },
      okText: '切換系統'.tr,
      outTouchCancellable: false,
      cancelText: '取消'.tr,
    );
  }

  static String getLabelFromDict(String type, int value) {
    for (var dict in ApiService.dictList) {
      if (dict.dictType == type && dict.value == value.toString()) {
        return dict.label!;
      }
    }
    return '';
  }

  static String getLabelFromActivityLevel(int value) {
    switch (value) {
      case 1:
        return '1.1';
      case 2:
        return '1.2';
      case 3:
        return '1.3';
      case 4:
        return '1.5';
      default:
        return '1.1';
    }
  }

  static String timestampToString(int timestamp) {
    if (timestamp == 0) {
      return '';
    }
    // 将时间戳（以毫秒为单位）转换为 DateTime 对象
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // 格式化日期为字符串
    String formattedDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}"
        "-${date.day.toString().padLeft(2, '0')} "
        "${date.hour.toString().padLeft(2, '0')}:"
        "${date.minute.toString().padLeft(2, '0')}:"
        "${date.second.toString().padLeft(2, '0')}";

    return formattedDate;
  }

  static Future<Uint8List?> getImageBytes(String filePath) async {
    try {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        // 用户之前拒绝了权限，尝试请求
        status = await Permission.storage.request();
      }

      if (status.isPermanentlyDenied) {
        // 用户选择了"不再询问"，需要手动打开设置
        openAppSettings();
      }

      // 通过文件路径创建 File 对象
      File file = File(filePath);

      // 检查文件是否存在
      if (await file.exists()) {
        // 读取文件并返回 Uint8List
        Uint8List bytes = await file.readAsBytes();
        return bytes;
      } else {
        print("文件不存在: $filePath");
        return null;
      }
    } catch (e) {
      print("读取文件失败: $e");
      return null;
    }
  }

  static String getMealTypeDesc(int mealType) {
    switch (mealType) {
      case 0:
        return '早餐';
      case 1:
        return '午餐';
      case 2:
        return '晚餐';
      case 3:
        return '夜宵';
      case 4:
        return '饮料';
      case 5:
        return '零食';
      default:
        return '';
    }
  }

  static Future<void> scanQRCode({
    required Function(String code) onSuccess,
  }) async {
    Get.to(() => const ScanCodePage(), transition: Transition.downToUp)!
        .then((code) {
      if (code != null && code.toString().isNotEmpty) {
        onSuccess(code.toString());
      }
    });
  }

  /// 将 DateTime 格式化为 yyyy-MM-dd 字符串
  static String formatDateKey(DateTime? date) {
    if (date == null) return "";
    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }

  /// 将 DateTime 格式化为 yyyy年MM月dd日 字符串
  static String formatDateKeyChinese(DateTime? date) {
    if (date == null) return "";
    return "${date.year.toString().padLeft(4, '0')}年"
        "${date.month.toString().padLeft(2, '0')}月"
        "${date.day.toString().padLeft(2, '0')}日";
  }
}
