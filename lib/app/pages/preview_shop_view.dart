import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'preview_shop_logic.dart';
import 'userinfo_view.dart';

/// 预览商店页面
class PreviewShopView extends StatelessWidget {
  const PreviewShopView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PreviewShopLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 顶部用户信息区域
            const UserInfoView(),

            // 主要内容区域

            // 商店信息卡片
            _buildStoreInfoCard(logic),

            const SizedBox(height: 4),

            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    '我的賣家訊息',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // 我的賣家訊息卡片
            _buildSellerInfoCard(logic),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// 构建商店信息卡片
  Widget _buildStoreInfoCard(PreviewShopLogic logic) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 商店头像
              Container(
                width: 94,
                height: 94,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/about_me_icon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // 商店信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          logic.storeName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          // decoration: BoxDecoration(
                          //   color: Colors.blue.shade100,
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          child: Text(
                            logic.storeCategory,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 商店标签
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: logic.storeTags
                          .map((tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF9747FF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '電話：${logic.storePhone.value}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '地址：${logic.storeAddress.value}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  /// 构建我的賣家訊息卡片
  Widget _buildSellerInfoCard(PreviewShopLogic logic) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 用户头像
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/about_me_icon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // 用户信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                          logic.userName.value,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        )),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/org_icon.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Obx(() => Text(
                                        logic.organizationName.value,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF616161),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/sub_icon.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Obx(() => Text(
                                        logic.branchName.value,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF616161),
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/img/contact_icon.png',
                              width: 55,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Image.asset(
                              'assets/img/browser_icon.png',
                              width: 65,
                              height: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
