import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/pages/main_view.dart';
import 'package:tiny_weight/app/widgets/toast.dart';

class RegisterLogic extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final smsCodeController = TextEditingController();
  final nameController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();

  final agreeTerms = false.obs;

  void toggleAgreeTerms(bool? value) {
    agreeTerms.value = value ?? false;
  }

  void sendSmsCode() {
    // TODO: 實現發送驗證碼邏輯
    EasyLoading.showInfo('發送驗證碼功能待實現');
  }

  void onRegister() {
    // TODO: 實現註冊邏輯
    if (!agreeTerms.value) {
      EasyLoading.showInfo('請先同意使用者條款');
      return;
    }
    showLoading(text: '正在註冊...');
    Future.delayed(const Duration(seconds: 2), () {
      hideLoading();
      EasyLoading.showSuccess('註冊成功');
      Get.to(() => const MainPage(), transition: Transition.fadeIn);
    });
  }

  void onTerms() {
    // TODO: 跳轉到使用者條款頁
    EasyLoading.showInfo('使用者條款功能待實現');
  }

  void onContactUs() {
    // TODO: 跳轉到聯絡我們頁
    EasyLoading.showInfo('聯絡我們功能待實現');
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    smsCodeController.dispose();
    nameController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    super.onClose();
  }
}
