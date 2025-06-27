import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/common/widget_extention.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'login_logic.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({super.key});

  @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  final LoginLogic logic = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                // Logo
                Image.asset(
                  '${base_img_path}app_icon.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 24),
                // 標題
                const Text(
                  '商聯思維',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ).animationSlideYFadein(),
                const SizedBox(height: 8),
                // 副標題
                const Text(
                  '共生  ・  共銷  ・  共創',
                  style: TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                ).animationSlideYFadein(),
                const SizedBox(height: 32),
                // 登入表單
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '登入',
                        style: TextStyle(
                          color: Color(0xFFAF8AFF),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: logic.usernameController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: '用戶名稱 / 手提電話號碼',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30), // 圓角
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Obx(() => SizedBox(
                            height: 40,
                            child: TextField(
                              controller: logic.passwordController,
                              obscureText: logic.obscurePassword.value,
                              decoration: InputDecoration(
                                hintText: '密碼',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(24), // 建議設為高度一半
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    logic.obscurePassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: logic.togglePasswordVisibility,
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: logic.onRegister,
                              child: const Text(
                                '註冊成為普通會員',
                                style: TextStyle(color: KColor.textblueColor),
                              )),
                          TextButton(
                            onPressed: logic.onTerms,
                            child: const Text('使用者條款',
                                style: TextStyle(color: KColor.textblueColor)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: SizedBox(
                          width: 120,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: logic.onLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4285F4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 0),
                            ),
                            child: const Text('GO',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // 其他登入方式
                const Text(
                  '或用以下方式登入及註冊',
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('${base_img_path}facebook_icon.png',
                          width: 30, height: 30),
                      onPressed: logic.onLoginFacebook,
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: Image.asset('${base_img_path}google_icon.png',
                          width: 30, height: 30),
                      onPressed: logic.onLoginGoogle,
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: Image.asset('${base_img_path}apple_icon.png',
                          width: 30, height: 30),
                      onPressed: logic.onLoginApple,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // 申請成為商家
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('申請成為商家？',
                        style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: logic.onContactUs,
                      child: const Text('按此聯絡我們',
                          style: TextStyle(color: KColor.textblueColor)),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Kcolor {}
