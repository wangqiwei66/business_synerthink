import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/pages/userinfo_view.dart';
import 'package:tiny_weight/app/widgets/scalable.dart';
import 'organization_logic.dart';

class OrganizationView extends StatelessWidget {
  OrganizationView({super.key});
  final logic = Get.put(OrganizationLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F9),
      body: Column(
        children: [
          const UserInfoView(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Image.asset(
                    'assets/img/info_icon.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '尚未參與任何組織',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  _buildCard(
                    imagepath: 'createOrg.png',
                    title: '創建組織',
                    subtitle: '創建組織條件',
                    desc: '用戶必須持有分會，為該分會的分會長，並已繳付分會長加盟費用。詳情可聯絡我們線上客服。',
                  ),
                  _buildCard(
                    imagepath: 'addOrg.png',
                    title: '加入組織',
                    subtitle: '加入分會條件',
                    desc:
                        '用戶必須持有分會，為該分會的分會長，並已繳付分會長加盟費用。繳付成功後，系統開放商家會員後即可按左方圖示加入任何您感興趣的組織。',
                  ),
                  _buildCard(
                    imagepath: 'searchOrg.png',
                    title: '組織搜索',
                    subtitle: '組織搜索',
                    desc:
                        '用戶亦可進入組織搜索版面，設定篩選條件，搜尋你想加入的組織。加入組織後所有分會會員自動歸為該分會所隸屬的組織之成員。詳情可聯絡我們線上客服。',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String imagepath,
    required String title,
    required String subtitle,
    required String desc,
    VoidCallback? onTap,
  }) {
    return ScalableWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000), // 右下角更明显的阴影
              blurRadius: 18,
              offset: Offset(6, 10),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Image.asset('$base_img_path$imagepath'),
                  ),
                  const SizedBox(height: 10),
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 18, right: 18, bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtitle,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(desc,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black87, height: 1.5)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
