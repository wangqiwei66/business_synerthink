import 'package:get/get.dart';
import 'package:tiny_weight/app/common/shared_info.dart';
import 'package:tiny_weight/app/controllers/user_controller.dart';
import 'package:tiny_weight/app/service/api_service.dart';
import 'package:tiny_weight/app/models/user_info/user_info.dart';

// ignore: constant_identifier_names
enum ViewState { Idle, Busy, Error, TOKEN_INVALID, EMPTY, DONE }

class BaseLogic extends GetxController {
  ViewState _state = ViewState.Idle;
  String message = '请求出错了';
  bool isListRefresh = false;

  ViewState get state => _state;
  final double screenHeight = Get.mediaQuery.size.height;
  final double screenWidth = Get.mediaQuery.size.width;

  void setState(ViewState viewState) {
    if (isListRefresh) return;
    _state = viewState;

    update();
  }
}
