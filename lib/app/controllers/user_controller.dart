import 'package:get/get.dart';
import 'package:tiny_weight/app/models/user_info/user_info.dart';
import 'package:tiny_weight/app/common/shared_info.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  final Rxn<UserInfo> _userInfo = Rxn<UserInfo>(); // Rxn 允许 null
  UserInfo? get userInfo => _userInfo.value; // 让外部访问 .value

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();

    // 添加用户信息变化监听
    ever(_userInfo, (_) {
      // 通知相关页面刷新
      update(['home_page', 'mine_page']);
    });
  }

  Future<void> loadUserInfo() async {
    try {
      _userInfo.value = await SharedInfo().userInfo; // 允许为空
    } catch (e) {
      print("加载用户信息失败: $e");
    }
  }

  Future<void> setUserInfo(UserInfo? user) async {
    _userInfo.value = user;
    await SharedInfo().setUserInfo(user);
  }
}
