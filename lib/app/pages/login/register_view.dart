import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/common/widget_extention.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/widgets/toast.dart';
import 'register_logic.dart';

class RegisterView extends StatelessWidget {
  final logic = Get.put(RegisterLogic());

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232323),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                // Logo
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset(
                    '${base_img_path}app_icon.png',
                    width: 120,
                  ),
                ),
                // 标题
                Text(
                  '商聯思維',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ).animationSlideYFadein(),
                const SizedBox(height: 8),
                // 副标题
                const Text(
                  '共生  ・  共銷  ・  共創',
                  style: TextStyle(
                    color: Color(0xFFFFC857),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ).animationSlideYFadein(),
                const SizedBox(height: 14),
                // 注册表单
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(24),
                    border:
                        Border.all(color: KColor.textPurpleColor, width: 0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '註冊',
                        style: TextStyle(
                          color: KColor.textPurpleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                          logic.usernameController, '用戶名稱 / 手提電話號碼'),
                      const SizedBox(height: 16),
                      _buildTextField(logic.passwordController, '密碼',
                          obscure: true),
                      const SizedBox(height: 16),
                      _buildTextField(logic.confirmPasswordController, '確認密碼',
                          obscure: true),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                                logic.smsCodeController, '手機驗證碼'),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: KColor.textPurpleColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: logic.sendSmsCode,
                              child: const Text('發送驗證碼',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(logic.nameController, '姓名 (中英文皆可)'),
                      const SizedBox(height: 16),
                      _buildTextField(logic.address1Controller, '地址1'),
                      const SizedBox(height: 16),
                      _buildTextField(logic.address2Controller, '地址112'),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                value: logic.agreeTerms.value,
                                onChanged: logic.toggleAgreeTerms,
                                activeColor: const Color(0xFF7C4DFF),
                              )),
                          const Text(
                            '我已閱讀及同意 ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: logic.onTerms,
                            child: const Text(
                              '使用者條款',
                              style: TextStyle(
                                color: KColor.buttomBgBlueColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: SizedBox(
                          height: 30,
                          width: 120,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KColor.buttomBgBlueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: logic.onRegister,
                            child: const Text('註冊',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('申請成為商家？',
                        style: TextStyle(color: Colors.white70)),
                    GestureDetector(
                      onTap: logic.onContactUs,
                      child: const Text(
                        ' 按此聯絡我們',
                        style: TextStyle(
                          color: KColor.buttomBgBlueColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {bool obscure = false}) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xFF7C4DFF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xFF2196F3)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        ),
      ),
    );
  }
}
