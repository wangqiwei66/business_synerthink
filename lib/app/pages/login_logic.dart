import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/pages/main_view.dart';
import 'package:tiny_weight/app/widgets/toast.dart';

class LoginLogic extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onLogin() {
    // TODO: 實現登入邏輯
    showLoading(text: '正在登入...');
    Future.delayed(const Duration(seconds: 2), () {
      hideLoading();
      Get.to(() => const MainPage(), transition: Transition.fadeIn);
    });
  }

  void onRegister() {
    // TODO: 跳轉到註冊頁
    EasyLoading.showInfo('註冊功能待實現');
  }

  void onTerms() {
    // TODO: 跳轉到使用者條款頁
    EasyLoading.showInfo('使用者條款功能待實現');
  }

  void onLoginFacebook() {
    // TODO: Facebook 登入
    // 這裡可以使用 Facebook SDK 進行登入
    // 目前僅顯示提示
    EasyLoading.showInfo('Facebook 登入待實現');
  }

  void onLoginGoogle() {
    // TODO: Google 登入
    // 這裡可以使用 Google Sign-In SDK 進行登入
    // 目前僅顯示提示
    EasyLoading.showInfo('Google 登入待實現');
  }

  void onLoginApple() {
    // TODO: Apple 登入
    // 這裡可以使用 Apple Sign-In SDK 進行登入
    // 目前僅顯示提示
    EasyLoading.showInfo('Apple 登入待實現');
  }

  void onContactUs() {
    // TODO: 跳轉到聯絡我們頁
    // 目前僅顯示提示
    EasyLoading.showInfo('聯絡我們功能待實現');
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
