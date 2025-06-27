import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiny_weight/app/pages/userinfo_view.dart';
import 'activity_logic.dart';

class ActivityView extends StatelessWidget {
  ActivityView({super.key});
  final logic = Get.put(ActivityLogic());

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleBar(),
                  _buildCalendar(),
                  _buildTips(),
                  _buildSection('跨分會活動'),
                  _buildActivityCard(),
                  _buildSection('分會活動'),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 0, 0),
      child: Row(
        children: [
          const Text('活動列表',
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF8B8B8B),
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _legendDot(Colors.pink, '跨分會活動'),
        _legendDot(Colors.amber, '分會活動'),
        _legendDot(Colors.cyan, 'AI推薦'),
        _legendDot(Colors.grey, '已報名'),
      ],
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          margin: const EdgeInsets.only(right: 4, left: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildCalendar() {
    // 这里只做静态UI示例，实际可用第三方日历控件
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('March', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            // 静态日历行
            _buildCalendarRow(['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'],
                isHeader: true),
            _buildCalendarRow(['', '', '', '', '', '1', '2'], dots: [6]),
            _buildCalendarRow(['3', '4', '5', '6', '7', '8', '9'], dots: [5]),
            _buildCalendarRow(['10', '11', '12', '13', '14', '15', '16'],
                dots: [2]),
            _buildCalendarRow(['17', '18', '19', '20', '21', '22', '23'],
                dots: [6]),
            _buildCalendarRow(['24', '25', '26', '27', '28', '29', '30']),
            _buildCalendarRow(['31', '', '', '', '', '', '']),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarRow(List<String> days,
      {bool isHeader = false, List<int>? dots}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(days.length, (i) {
        final isDot = dots != null && dots.contains(i);
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isHeader
                ? Colors.transparent
                : (i == 0 && !isHeader)
                    ? const Color(0xFF363140)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: isHeader
                ? Text(days[i], style: const TextStyle(color: Colors.grey))
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(days[i],
                          style: TextStyle(
                              color: i == 0 && !isHeader
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold)),
                      if (isDot)
                        Positioned(
                          bottom: 4,
                          right: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                    ],
                  ),
          ),
        );
      }),
    );
  }

  Widget _buildTips() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '點選日期，下方自動顯示該日期活動詳情',
            style: TextStyle(color: Color(0xFFB36AFF), fontSize: 15),
          ),
          Text(
            '未加入分會人士，系統自動顯示所有公開活動。',
            style: TextStyle(color: Colors.pink, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 0, 8),
      child: Text(title,
          style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildActivityCard() {
    // 示例卡片
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/img/meal1.jpg',
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        '【組織】活動標題欄，限制文字30字元以內，超出字數系統自動隱藏多出的文字',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB36AFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('舉辦組織名稱',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('活動類型',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('可報名',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Row(
                  children: [
                    Text('活動時間: 2025/3/1',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    SizedBox(width: 8),
                    Text('地點: 銅鑼灣',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    SizedBox(width: 8),
                    Text('費用: \$1,000',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 2),
                const Row(
                  children: [
                    Text('人數: 30',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                    SizedBox(width: 8),
                    Text('主辦分會: ABCD CHAPTER',
                        style: TextStyle(fontSize: 13, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Expanded(
                      child: Text('主辦機構: ABCD DRESSING CO.LTD',
                          style: TextStyle(
                              color: Color(0xFF1A73E8),
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB36AFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        minimumSize: const Size(0, 32),
                      ),
                      onPressed: () {},
                      child: const Text('更多詳情',
                          style: TextStyle(fontSize: 13, color: Colors.white)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        minimumSize: const Size(0, 32),
                      ),
                      onPressed: () {},
                      child: const Text('直接報名',
                          style: TextStyle(fontSize: 13, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
