import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingLogic extends GetxController {
  final shopNameController = TextEditingController();
  final shopTypeController = TextEditingController();
  final shopDescController = TextEditingController();
  final shopTagsController = TextEditingController();
  final shopAddressController = TextEditingController();
  final shopCallController = TextEditingController();
  final shopPhoneController = TextEditingController();

  // 标签
  final RxList<String> tags = <String>['家居生活', '智能產品', '家庭電器', '消閒科技'].obs;

  @override
  void onClose() {
    shopNameController.dispose();
    shopTypeController.dispose();
    shopDescController.dispose();
    shopTagsController.dispose();
    shopAddressController.dispose();
    shopCallController.dispose();
    shopPhoneController.dispose();
    super.onClose();
  }
}
