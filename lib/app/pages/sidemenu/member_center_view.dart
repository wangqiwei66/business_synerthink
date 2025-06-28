import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/pages/login/login_view.dart';
import 'member_center_logic.dart';

class MemberCenterView extends StatelessWidget {
  MemberCenterView({super.key});
  final logic = Get.put(MemberCenterLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundLightColor,
      appBar: AppBar(
        backgroundColor: KColor.backgroundLightColor,
        elevation: 0,
        title: const Text('會員中心',
            style: TextStyle(
                color: Color(0xFF51185C), fontWeight: FontWeight.bold)),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头像与基本信息
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
                                    color: Colors.white70, fontSize: 13)),
                            const SizedBox(width: 8),
                            const Icon(Icons.diamond,
                                color: Colors.white, size: 14),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(logic.orgStats['orgName'].toString(),
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text('等級 1',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 组织统计
              _buildOrgStats(),
              const SizedBox(height: 8),
              // 分会统计
              _buildBranchStats(),
              const SizedBox(height: 12),
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

  Widget _buildOrgStats() {
    final data = logic.orgStats;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shield, color: Colors.deepPurple),
              const SizedBox(width: 8),
              Text('${data['orgName']}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('組織總體數據', style: TextStyle(fontSize: 12)),
              ),
              const Spacer(),
              const Text('組織目標', style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 4),
              Text('${data['target']}',
                  style: const TextStyle(color: Colors.orange)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildStatBlock('成員', data['totalMember'].toString()),
              _buildStatBlock('獎金', data['totalBonus'].toString()),
              _buildStatBlock('總資產', '\$4,000'), // 这里修正为实际金额
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBranchStats() {
    final data = logic.branchStats;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shield, color: Colors.teal),
              const SizedBox(width: 8),
              Text('${data['branchName']}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('分會總體數據', style: TextStyle(fontSize: 12)),
              ),
              const Spacer(),
              const Text('分會目標', style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 4),
              Text('${data['level']}',
                  style: const TextStyle(color: Colors.orange)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildStatBlock('A', data['a'].toString()),
              _buildStatBlock('B', data['b'].toString()),
              _buildStatBlock('C', data['c'].toString()),
              _buildStatBlock('D', data['d'].toString()),
            ],
          ),
          const SizedBox(height: 4),
          const Text('總資產:\$4,000',
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
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
    final entries = [
      {'icon': Icons.person, 'label': '人員頁面'},
      {'icon': Icons.whatshot, 'label': '最近任務'},
      {'icon': Icons.campaign, 'label': '解決方案'},
      {'icon': Icons.groups, 'label': '合作分會'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: entries
          .map((e) => Column(
                children: [
                  Icon(e['icon'] as IconData, color: Colors.pink, size: 32),
                  const SizedBox(height: 4),
                  Text(e['label'] as String,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 12)),
                ],
              ))
          .toList(),
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
