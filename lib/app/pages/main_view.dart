import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/font.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/pages/main_logic.dart';
import 'package:tiny_weight/app/widgets/button.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';
import 'package:tiny_weight/app/widgets/uploadpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  late final MainLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(MainLogic());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      //進入應用時候不會觸發該狀態 應用程式處於可見狀態，並且可以響應使用者的輸入事件。它相當於 Android 中Activity的onResume
      case AppLifecycleState.resumed:
        print("應用進入前臺======");
        {
          // getLast();
          // ApiService().refreshToken();
        }
        break;
      //應用狀態處於閒置狀態，並且沒有使用者的輸入事件，
      // 注意：這個狀態切換到 前後臺 會觸發，所以流程應該是先凍結視窗，然後停止UI
      case AppLifecycleState.inactive:
        print("應用處於閒置狀態，這種狀態的應用應該假設他們可能在任何時候暫停 切換到後臺會觸發======");
        break;
      //當前頁面即將退出
      case AppLifecycleState.detached:
        print("當前頁面即將退出======");
        break;
      // 應用程式處於不可見狀態
      case AppLifecycleState.paused:
        print("應用處於不可見狀態 後臺======");
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLogic>(builder: (model) {
      return UpdaterPage(Scaffold(
        appBar: kIsWeb
            ? AppBar(
                title: const Text(
                  "獲取更好體驗,下載商聯思維 app",
                  style: KFont.listStyle,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 30,
                      width: 80,
                      child: CzButton(
                        ontap: () {},
                        text: "前往下載",
                        boderadius: 24,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              )
            : null,
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF363140),
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xFF65A9BE),
          selectedFontSize: 12,
          currentIndex: model.currentIndex,
          items: logic.homepageTabItems,
          onTap: (index) async {
            model.changeIndex(index);
          },
        ),
        floatingActionButton: ScalableWell(
            onTap: () async {
              model.changeIndex(2);
            },
            child: Container(
              height: 78,
              width: 78,
              decoration: const BoxDecoration(
                color: Color(0xFF363140),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                model.currentIndex == 2
                    ? '${base_img_path}ai_icon_pressed.png'
                    : '${base_img_path}ai_icon.png',
                fit: BoxFit.fill,
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
          index: model.currentIndex,
          children: logic.homepageWidgets,
        ),
      ));
    });
  }
}
