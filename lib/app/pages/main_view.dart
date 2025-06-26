import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/pages/setting_view.dart';
import 'main_logic.dart';
import 'mall_view.dart';
import 'ai_search_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainLogic logic = Get.put(MainLogic());

  final List<Widget> _pages = [
    MallView(),
    const Center(child: Text('活動', style: TextStyle(fontSize: 24))),
    AiSearchView(),
    const Center(child: Text('組織', style: TextStyle(fontSize: 24))),
    SettingView(),
  ];

  final List<BottomNavigationBarItem> _tabs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: '商城',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.event_note_outlined),
      label: '活動',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.auto_awesome),
      label: 'AI 搜索',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.groups_outlined),
      label: '組織',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.flag_outlined),
      label: '設置',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[logic.tabIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: logic.tabIndex.value,
            onTap: logic.onTabChange,
            items: _tabs,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => logic.onTabChange(2),
            backgroundColor: Colors.white,
            elevation: 4,
            child:
                const Icon(Icons.auto_awesome, color: Colors.purple, size: 32),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
