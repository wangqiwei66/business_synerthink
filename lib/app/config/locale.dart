import 'dart:ui';

import 'package:get/get.dart';
import 'package:tiny_weight/app/pages/main_view.dart';

enum LocaleKey {
  cn,
  hk,
  us,
}

class KLocale {
  Locale kzhLocale = const Locale('zh', 'CN');
  Locale kusLocale = const Locale('en', 'US');
  Locale khkLocale = const Locale('zh', 'HK');

  changeLocale({LocaleKey key = LocaleKey.hk, reLoad = true}) {
    if (key == LocaleKey.hk) {
      var locale = const Locale('zh', 'HK');
      Get.updateLocale(locale);
    } else if (key == LocaleKey.cn) {
      var locale = const Locale('zh', 'CN');
      Get.updateLocale(locale);
    } else if (key == LocaleKey.us) {
      var locale = const Locale('en', 'US');
      Get.updateLocale(locale);
    }
    if (reLoad == true) {
      Get.reloadAll(force: true);
      Get.offAll(() => const MainPage(), transition: Transition.fadeIn);
    }
  }
}
