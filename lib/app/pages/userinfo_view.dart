import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mall_logic.dart';
import 'side_menu_view.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MallLogic>();
    return Container(
      color: const Color(0xFF363140),
      padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/img/about_me_icon.png'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      logic.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.diamond, color: Colors.white, size: 20),
                  ],
                ),
                const Row(
                  children: [
                    Text('組織名稱', style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 8),
                    Text('分會名稱', style: TextStyle(color: Colors.white70)),
                    SizedBox(width: 8),
                    Text('等級 1', style: TextStyle(color: Colors.white70)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('積分：', style: TextStyle(color: Colors.white70)),
                    Text(logic.points.toString(),
                        style: const TextStyle(color: Colors.white70)),
                    const SizedBox(width: 8),
                    const Text('貢獻：', style: TextStyle(color: Colors.white70)),
                    Text(logic.contribution.toString(),
                        style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_control,
                    color: Colors.pinkAccent),
                onPressed: () {
                  showGeneralDialog(
                    context: Get.context!,
                    barrierLabel: 'side_menu',
                    barrierDismissible: true,
                    barrierColor: Colors.black54,
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (context, anim1, anim2) =>
                        const SizedBox.shrink(),
                    transitionBuilder: (context, anim1, anim2, child) {
                      final offset = Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                          parent: anim1, curve: Curves.easeOut));
                      return SlideTransition(
                        position: offset,
                        child: const SideMenuView(),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.mail_outline, color: Colors.pinkAccent),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
