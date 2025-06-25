import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_logic.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainLogic logic = Get.put(MainLogic());

  final List<Widget> _pages = [
    const Center(child: Text('商城', style: TextStyle(fontSize: 24))),
    const Center(child: Text('活動', style: TextStyle(fontSize: 24))),
    const Center(child: Text('AI 搜索', style: TextStyle(fontSize: 24))),
    const Center(child: Text('組織', style: TextStyle(fontSize: 24))),
    const Center(child: Text('設置', style: TextStyle(fontSize: 24))),
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
