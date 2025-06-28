import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/pages/userinfo_view.dart';
import 'setting_logic.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});
  final logic = Get.put(SettingLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserInfoView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text('個人設置',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('您的UID: #33669980',
                          style: TextStyle(fontSize: 14)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('成為商家/分會長？按這裡 聯絡我們',
                            style: TextStyle(color: Colors.blue, fontSize: 12)),
                      ),
                    ],
                  ),
                  _buildInputRow('您的商店名稱', logic.shopNameController),
                  const SizedBox(height: 16),
                  _buildInputRow('商店行業類別', logic.shopTypeController,
                      hint: '10字元以內', maxInputCount: 10),
                  const SizedBox(height: 16),
                  _buildInputRow('商店介紹', logic.shopDescController,
                      hint: '請輸入商店介紹文字', maxLines: 6),
                  _buildTagInput(),
                  _buildUploadHead(),
                  const SizedBox(height: 16),
                  _buildInputRow('您的商店地址', logic.shopAddressController,
                      maxLines: 4),
                  const SizedBox(height: 16),
                  _buildInputRow('您的稱呼', logic.shopCallController),
                  const SizedBox(height: 16),
                  _buildInputRow('您的商用電話號碼（只限香港）', logic.shopPhoneController),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 0),
                          ),
                          onPressed: () {},
                          child: const Text('返回主頁',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 24),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 0),
                          ),
                          onPressed: () {},
                          child: const Text('預覽商店頁',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFF4B406B),
      padding: const EdgeInsets.only(top: 36, left: 0, right: 0, bottom: 8),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/img/about_me_icon.png'),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('CHAN TAI MAN, TAYLOR',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.diamond, color: Colors.white, size: 18),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text('組織名稱',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                    SizedBox(width: 8),
                    Text('分會名稱',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                    SizedBox(width: 8),
                    Text('等級 1',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text('積分：1000000',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                    SizedBox(width: 8),
                    Text('貢獻：888',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.mail_outline, color: Colors.pinkAccent),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow(String label, TextEditingController controller,
      {String? hint,
      int maxLines = 1,
      VoidCallback? onConfirm,
      int? maxInputCount}) {
    final height = 30.0 * maxLines;
    final borderRadius =
        maxLines == 1 ? BorderRadius.circular(32) : BorderRadius.circular(12);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: height,
                  maxHeight: height,
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  controller: controller,
                  maxLines: maxLines,
                  minLines: maxLines,
                  maxLength: maxInputCount,
                  buildCounter: (
                    BuildContext context, {
                    required int currentLength,
                    required bool isFocused,
                    required int? maxLength,
                  }) {
                    return null; // 不显示默认计数器
                  },
                  inputFormatters: maxInputCount != null
                      ? [
                          LengthLimitingTextInputFormatter(maxInputCount),
                        ]
                      : null,
                  decoration: InputDecoration(
                    hintText: hint ?? '請輸入文字，完成後按右方設定',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    border: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide: const BorderSide(color: Color(0xFFB2C6D6)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide: const BorderSide(color: Color(0xFFB2C6D6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: borderRadius,
                      borderSide:
                          const BorderSide(color: Color(0xFF7C4DFF), width: 2),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: onConfirm,
              child: Container(
                height: 30,
                width: 50,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5AD6FF),
                      Color(0xFF2D9CFF),
                      Color(0xFF7B6CFF)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                    '設定',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildTagInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('建立商家標籤',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        SizedBox(
          height: 30,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: logic.shopTagsController,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: '#商家標籤 (請輸入後按添加，提升您的曝光率)',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Color(0xFFB2C6D6)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Color(0xFFB2C6D6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide:
                          const BorderSide(color: Color(0xff9747ff), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 50,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5AD6FF),
                        Color(0xFF2D9CFF),
                        Color(0xFF7B6CFF)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text(
                      '設定',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Wrap(
              spacing: 8,
              runSpacing: 4,
              children: logic.tags
                  .map((tag) => TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF7C4DFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 0),
                          minimumSize: const Size(0, 32),
                        ),
                        onPressed: () {},
                        child: Text(tag,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white)),
                      ))
                  .toList(),
            )),
      ],
    );
  }

  Widget _buildUploadHead() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('您的商店頭像',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 4),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add_circle, color: Color(0xFF7C4DFF)),
              onPressed: () {},
            ),
            const Text('按此上傳您的商店頭像 (只限1張)',
                style: TextStyle(color: Color(0xFF1A73E8), fontSize: 14)),
          ],
        ),
      ],
    );
  }
}
