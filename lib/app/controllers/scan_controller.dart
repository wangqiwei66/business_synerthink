import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/controllers/user_controller.dart';
import 'package:tiny_weight/app/models/user_info/user_info.dart';
import 'package:tiny_weight/app/service/api_service.dart';
import 'package:tiny_weight/app/widgets/toast.dart';

class ScanController extends GetxController {
  static ScanController get to => Get.find();

  Future<bool> handleScanCode(String code) async {
    print('handleScanCode: $code');
    // 解析URL中的qrcode参数
    // Uri uri = Uri.parse(code);
    // String qrCode = uri.queryParameters['qrcode'] ?? '';

    if (code.isEmpty) {
      EasyLoading.showError('无效的二维码'.tr, dismissOnTap: true);
      return false;
    }

    EasyLoading.show(status: '查询中'.tr);
    try {
      // DynamicMap resp = await ApiService().getBottleByQrCode(qrcode: code);
      // EasyLoading.dismiss();

      // if (resp['result'] != 0) {
      //   EasyLoading.showError(resp['message'].toString(), dismissOnTap: true);
      //   return false;
      // }

      return true;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('查询失败'.tr, dismissOnTap: true);
      return false;
    }
  }
}
