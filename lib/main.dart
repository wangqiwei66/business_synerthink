import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiny_weight/app/common/shared_info.dart';
import 'package:tiny_weight/app/common/sp.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/const.dart';
import 'package:tiny_weight/app/controllers/scan_controller.dart';
import 'package:tiny_weight/app/controllers/user_controller.dart';
import 'package:tiny_weight/app/pages/login/login_view.dart';
import 'package:tiny_weight/app/pages/seller_main_view.dart';
import 'package:tiny_weight/app/service/api_service.dart';
import 'package:tiny_weight/app/models/user_info/user_info.dart';
import 'package:tiny_weight/generated/locales.g.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGlobalUI();
  await Future.wait([
    SpUtil.init(),
    ApiService.init(),
  ]);
  Fluwx fluwx = Fluwx();
  fluwx.registerApi(
      appId: kWeChatAppId,
      universalLink: '',
      doOnAndroid: true,
      doOnIOS: false);
  Get.put(UserController(), permanent: true);
  refreshToken();
  runApp(const MyApp());

  // runApp(
  //   GetMaterialApp(
  //     title: 'Tiny Weight',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: isFirstOpen ? const GuideView() : LoginViewPage(),
  //   ),
  // );
}

refreshToken() async {
  print('refresh token');
  int? expiredTime = await SharedInfo().expiresTime;
  if (expiredTime == null) {
    return;
  }
  int day = 0;
  try {
    day = DateTime.fromMillisecondsSinceEpoch(expiredTime)
        .difference(DateTime.now())
        .inDays;
  } catch (e) {
    day = 0;
  }

  print('token expried days: $day');

  if (day <= 15) {
    await ApiService().refreshMyToken();
  }

  UserInfo? userInfo = await SharedInfo().userInfo;
}

void setupGlobalUI() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2) // 显示持续时间
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = KColor.appbarColor
    ..progressColor = KColor.appbarColor
    ..textColor = Colors.black87
    ..maskColor = Colors.black.withOpacity(0.5)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false // 加载时禁止用户交互
    ..dismissOnTap = true // 点击可关闭
    ..indicatorSize = 45.0
    ..radius = 12.0 // 圆角
    ..boxShadow = [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 10,
        offset: const Offset(0, 2),
      )
    ]
    ..indicatorWidget = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KColor.appbarColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(KColor.appbarColor),
      ),
    ) // 自定义加载指示器
    ..successWidget = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KColor.appbarColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check_circle_outline,
        color: KColor.appbarColor,
        size: 32,
      ),
    ) // 自定义成功图标
    ..errorWidget = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 32,
      ),
    ) // 自定义错误图标
    ..infoWidget = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KColor.appbarColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.info_outline,
        color: KColor.appbarColor,
        size: 32,
      ),
    ) // 自定义信息图标
    ..textPadding = const EdgeInsets.symmetric(
      horizontal: 24.0,
      vertical: 12.0,
    )
    ..textStyle = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    )
    ..contentPadding = const EdgeInsets.symmetric(
      horizontal: 24.0,
      vertical: 16.0,
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'PingFang SC',
              fontFamilyFallback: const ['Microsoft YaHei', 'sans-serif'],
              primaryColor: Colors.purple,
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)), // 全局圓角
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)), // 全局圓角
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)), // 全局圓角
                  borderSide: BorderSide(
                    color: KColor.boderblueColor,
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            translationsKeys: AppTranslation.translations,
            locale: const Locale('zh', 'CN'),
            fallbackLocale: const Locale('zh', 'CN'),
            title: '商聯思維'.tr,
            routes: {
              '/main': (context) => const SellerMainPage(),
              '/login': (context) => const LoginViewPage()
            },
            builder: EasyLoading.init(),
            home: FutureBuilder<bool>(
              future: SharedPreferences.getInstance().then(
                (prefs) => prefs.getBool('isFirstOpen') ?? true,
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final isFirstOpen = snapshot.data!;
                // 标记已打开过
                if (isFirstOpen) {
                  SharedPreferences.getInstance()
                      .then((prefs) => prefs.setBool('isFirstOpen', false));
                }
                return UserController.to.userInfo?.uid == null ||
                        UserController.to.userInfo!.uid!.isEmpty
                    ? isFirstOpen
                        ? const LoginViewPage()
                        : const LoginViewPage()
                    : const SellerMainPage();
                // MainPage();
              },
            ),
          ),
        );
      },
    );
  }
}
