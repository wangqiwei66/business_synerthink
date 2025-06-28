import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 2 / 3,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF868995),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  // 头像
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/img/about_me_icon.png'),
                  ),
                  const SizedBox(height: 24),
                  // 用户名
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CHAN TAI MAN, TAYLOR',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      SizedBox(width: 8),
                      Icon(Icons.diamond, color: Colors.white, size: 14),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('組織名稱',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      Text('等級 1',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('分會名稱',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('積分：1000000',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      Text('貢獻：888',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          const Icon(Icons.mail_outline,
                              color: Colors.pink, size: 32),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.pinkAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        // decoration: BoxDecoration(
                        //   color: const Color(0xFFB2E0F7),
                        //   borderRadius: BorderRadius.circular(12),
                        // ),
                        child: const Icon(Icons.shopping_cart,
                            color: Color(0xFF00FFD0), size: 32),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // 菜单项
                  ...[
                    '會員中心',
                    '訊息中心',
                    '活動',
                    '商城',
                    '子商城',
                    '組織及分會',
                    '獎金系統',
                    '任務',
                    '公平交易平台 (未開放)',
                    '積分兌換 (未開放)',
                    '常見問題',
                    '客服及支援',
                    '登入及驗證',
                  ].map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
