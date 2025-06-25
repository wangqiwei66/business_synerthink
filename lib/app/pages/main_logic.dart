import 'package:get/get.dart';

class MainLogic extends GetxController {
  var tabIndex = 0.obs;

  void onTabChange(int index) {
    tabIndex.value = index;
  }
}
