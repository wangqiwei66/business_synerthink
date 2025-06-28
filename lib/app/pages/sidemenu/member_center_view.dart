import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/config/path.dart';
import 'package:tiny_weight/app/pages/login/login_view.dart';
import 'package:tiny_weight/app/widgets/divider.dart';
import 'member_center_logic.dart';

class MemberCenterView extends StatelessWidget {
  MemberCenterView({super.key});
  final logic = Get.put(MemberCenterLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundLightColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头像与基本信息
              _buildBaseInfoView(),
              const SizedBox(height: 4),
              // 通知卡片
              _buildNotificationCards(),
              const SizedBox(height: 12),
              // 组织统计
              _buildOrgStats(),
              const SizedBox(height: 24),
              // 分会统计
              _buildBranchStats(),
              const SizedBox(height: 24),
              // 快捷入口
              _buildQuickEntry(),
              const SizedBox(height: 12),
              // 商品点评
              _buildProductReviews(),
              const SizedBox(height: 12),
              // 近期活动
              _buildRecentActivities(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBaseInfoView() {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage('assets/img/about_me_icon.png'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CHAN TAI MAN, TAYLOR',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(logic.orgStats['level'].toString(),
                          style: const TextStyle(
                              color: Color(0xFF888B94), fontSize: 13)),
                      const SizedBox(width: 8),
                      const Icon(Icons.diamond,
                          color: Color(0xFF888B94), size: 14),
                      const Spacer(),
                      const Text('尚餘 10000 貢獻升至等級 2',
                          style: TextStyle(
                              color: Color(0xFF888B94), fontSize: 12)),
                      const SizedBox(
                        width: 12,
                      )
                    ],
                  ),
                  const SizedBox(height: 2),
                  Container(
                    height: 12,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: 0.2), // 進度值從0到0.7
                        duration: const Duration(milliseconds: 500),
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            value: value,
                            backgroundColor: const Color(0xFFD9D9D9),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF8F3CCA)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                '${base_img_path}current_right_icon.png',
                width: 56,
                height: 56,
              ),
            ),
          ],
        ),
        CzDivider(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          width: double.infinity,
          height: 2,
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: KColor.backgroundLightColor,
      elevation: 0,
      title: const Text('會員中心',
          style:
              TextStyle(color: Color(0xFF51185C), fontWeight: FontWeight.bold)),
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset('assets/img/home_icon.png', width: 24, height: 24),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/img/earPhone_icon.png',
              width: 24, height: 24),
          onPressed: () {
            Get.back();
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.red,
            size: 44,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  /// 構建通知卡片組件
  Widget _buildNotificationCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          // 第一行通知卡片
          Row(
            children: [
              Expanded(
                child: _buildNotificationCard(
                  icon: Icons.message,
                  iconColor: const Color(0xFF4FC3F7),
                  title: '你有 99+ 條訊息未讀',
                  actionText: '前往 >>',
                  onTap: () {
                    // 處理點擊事件
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildNotificationCard(
                  icon: Icons.schedule,
                  iconColor: const Color(0xFF4FC3F7),
                  title: '分會活動於 30 天後舉行',
                  actionText: '前往 >>',
                  onTap: () {
                    // 處理點擊事件
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 第二行通知卡片
          Row(
            children: [
              Expanded(
                child: _buildNotificationCard(
                  icon: Icons.shopping_cart,
                  iconColor: const Color(0xFF26C6DA),
                  title: '你有 99+ 個商品未結賬',
                  actionText: '前往 >>',
                  onTap: () {
                    // 處理點擊事件
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildNotificationCard(
                  icon: Icons.star,
                  iconColor: const Color(0xFFFF6B6B),
                  title: '我已收藏的商品',
                  actionText: '前往 >>',
                  onTap: () {
                    // 處理點擊事件
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 第三行通知卡片
          Row(
            children: [
              Expanded(
                child: _buildNotificationCard(
                  icon: Icons.assignment,
                  iconColor: const Color(0xFFFF6B6B),
                  title: '你有 99+ 個未完成任務',
                  actionText: '前往 >>',
                  onTap: () {
                    // 處理點擊事件
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildNotificationCard(
                  icon: Icons.info,
                  iconColor: const Color(0xFFFF6B6B),
                  title: '你有 20 個新評價',
                  actionText: '前往 >>',
                  onTap: () {
                    // 處理點擊事件
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 構建單個通知卡片
  Widget _buildNotificationCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF888B94),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            actionText,
            style: const TextStyle(
              color: Color(0xFF9C27B0),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  /// 构建组织统计信息卡片
  Widget _buildOrgStats() {
    final data = logic.orgStats;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // 左侧盾牌图标
                  Image.asset('${base_img_path}org_icon.png',
                      width: 60, height: 60),

                  const SizedBox(width: 16),
                  // 中间内容区域
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 组织名称和标签
                        Row(
                          children: [
                            const Text(
                              '所屬組織名稱',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              // decoration: BoxDecoration(
                              //   color: Colors.orange.withOpacity(0.2),
                              //   borderRadius: BorderRadius.circular(4),
                              // ),
                              child: const Text(
                                '組織性質分類',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // 职位信息
                        Row(
                          children: [
                            const Text(
                              '組織擔任職銜',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              // decoration: BoxDecoration(
                              //   color: Colors.orange.withOpacity(0.2),
                              //   borderRadius: BorderRadius.circular(4),
                              // ),
                              child: const Text(
                                '組織所屬區分',
                                style: TextStyle(
                                  color: Color(0xFFF5156B),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  // 右侧贡献值
                  Column(
                    children: [
                      const Text(
                        '組織貢獻值',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFFB7B9C4),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '200K',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '已加入',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '120',
                                style: TextStyle(
                                  color: Color(0xFFD99201),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '天',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '會員數目',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '500',
                                style: TextStyle(
                                  color: Color(0xFFD99201),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '位',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    '共獲取獎金',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$240,000',
                    style: TextStyle(
                      color: Color(0xFF65A9BE),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: -8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              decoration: BoxDecoration(
                color: const Color(0xFF888B94),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '組織資訊',
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
            ))
      ],
    );
  }

  /// 构建分会统计信息卡片
  Widget _buildBranchStats() {
    final data = logic.branchStats;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // 左侧盾牌图标
                  Image.asset('${base_img_path}sub_icon.png',
                      width: 60, height: 60),
                  const SizedBox(width: 16),
                  // 中间内容区域
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 分会名称和标签
                        Row(
                          children: [
                            const Text(
                              '所屬分會名稱',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              // decoration: BoxDecoration(
                              //   color: Colors.orange.withOpacity(0.2),
                              //   borderRadius: BorderRadius.circular(4),
                              // ),
                              child: const Text(
                                '分會性質分類',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // 职位信息
                        Row(
                          children: [
                            const Text(
                              '分會擔任職銜',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              // decoration: BoxDecoration(
                              //   color: Colors.orange.withOpacity(0.2),
                              //   borderRadius: BorderRadius.circular(4),
                              // ),
                              child: const Text(
                                '分會所屬區分',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  // 右侧贡献值
                  Column(
                    children: [
                      const Text(
                        '分會貢獻值',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFB74D),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${data['contributionValue']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // 第一行统计数据
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '已加入',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['joinedDays']}',
                                style: const TextStyle(
                                  color: Color(0xFFD99201),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '天',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '會員數目',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['memberCount']}',
                                style: const TextStyle(
                                  color: Color(0xFFD99201),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '位',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // 第二行统计数据
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '已完成\n任務數',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['completedTasks']}',
                                style: const TextStyle(
                                  color: Color(0xFFE91E63),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '個',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '已協助\n活動數',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['assistedActivities']}',
                                style: const TextStyle(
                                  color: Color(0xFFE91E63),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '個',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // 第三行统计数据
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '已完成\n交易量',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['completedTransactions']}',
                                style: const TextStyle(
                                  color: Color(0xFF9C27B0),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '個',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '已參與\n活動數',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['participatedActivities']}',
                                style: const TextStyle(
                                  color: Color(0xFF9C27B0),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '個',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // 共获取奖金
              Row(
                children: [
                  const Text(
                    '共獲取獎金',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '\$${data['totalBonus'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                    style: const TextStyle(
                      color: Color(0xFF65A9BE),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
              color: const Color(0xFF65A9BE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '分會資訊',
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatBlock(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildQuickEntry() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: logic.quickActions
            .map((action) => Column(
                  children: [
                    Image.asset(
                      '$base_img_path${action['icon']}',
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(height: 4),
                    Text(action['label'], style: const TextStyle(fontSize: 14)),
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget _buildProductReviews() {
    final reviews = logic.productReviews;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('你的商品評論',
            style: TextStyle(
                color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        ...reviews.map((r) => Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(r['img'].toString(),
                          width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(r['user'].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text(r['title'].toString(),
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Text(r['desc'].toString(),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          Row(
                            children: [
                              Text(r['price'].toString(),
                                  style: const TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              ...List.generate(
                                  r['star']?.toString() != null
                                      ? int.parse(r['star'].toString())
                                      : 5,
                                  (i) => const Icon(Icons.star,
                                      color: Colors.amber, size: 14)),
                            ],
                          ),
                          Text('評價: ${r['review'] ?? ''}',
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildRecentActivities() {
    final acts = logic.recentActivities;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('近期活動',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        const SizedBox(height: 8),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: acts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final a = acts[i];
              return Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image.asset(a['img'] ?? '',
                          width: 120, height: 60, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a['title'] ?? '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text(a['desc'] ?? '',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
