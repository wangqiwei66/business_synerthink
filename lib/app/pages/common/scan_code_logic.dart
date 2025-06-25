import 'package:permission_handler/permission_handler.dart';
import 'package:tiny_weight/app/common/app_helper.dart';
import 'package:tiny_weight/app/models/base_logic.dart';
import 'package:tiny_weight/app/widgets/toast.dart';

class ScanCodeLogic extends BaseLogic {
  @override
  Future<void> onReady() async {
    AppHelper.checkPermission(Permission.camera);
    super.onReady();
  }

  var code = '';

  Future<bool> confirm() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    hideLoading();
    return true;
    // DynamicMap resp = await ApiService().withDrawTicketConfirm(code);

    // hideLoading();
    // if (resp['result'] != 200) {
    //   EasyLoading.showError(resp['message'].toString(), dismissOnTap: true);
    //   return false;
    // } else {
    //   return true;
    // }
  }
}
