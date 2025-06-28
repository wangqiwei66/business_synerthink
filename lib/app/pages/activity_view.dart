import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tiny_weight/app/config/color.dart';
import 'package:tiny_weight/app/pages/userinfo_view.dart';
import 'package:tiny_weight/app/widgets/divider.dart';
import 'activity_logic.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});
  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final logic = Get.put(ActivityLogic());
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserInfoView(),
            _buildTitleBar(),
            _buildCalendar(),
            _buildTips(),
            _buildSection('跨分會活動'),
            ...logic.crossChapterActivities
                .map((e) => _buildActivityCardItem(e))
                .toList(),
            _buildSection('分會活動'),
            ...logic.chapterActivities
                .map((e) => _buildActivityCardItem(e))
                .toList(),
            const SizedBox(height: 80),
          ],
        ),
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
                  fontSize: 20,
                  color: Color(0xFF8B8B8B),
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          Expanded(child: _buildLegend()),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return SizedBox(
      height: 28,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _legendDot(Colors.pink, '跨分會活動'),
            _legendDot(Colors.amber, '分會活動'),
            _legendDot(Colors.cyan, 'AI推薦'),
            _legendDot(Colors.grey, '已報名'),
          ],
        ),
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 11,
          height: 11,
          margin: const EdgeInsets.only(right: 4, left: 8),
          decoration: BoxDecoration(
            color: color,
            // borderRadius: BorderRadius.circular(4),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final isSaturday = day.weekday == DateTime.saturday;
              final isSunday = day.weekday == DateTime.sunday;
              if (isSaturday || isSunday) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: Color(0xFF2196F3),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              }
              return null;
            },
            todayBuilder: (context, day, focusedDay) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            selectedBuilder: (context, day, focusedDay) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.pink, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xFF2196F3), width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            todayTextStyle: const TextStyle(
                color: Color(0xFF2196F3), fontWeight: FontWeight.bold),
            selectedDecoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8),
            ),
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            weekendTextStyle: const TextStyle(color: Color(0xFF2196F3)),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            // 打印选中日期
            print('选中日期: $selectedDay');
          },
        ),
      ),
    );
  }

  Widget _buildTips() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '點選日期，下方自動顯示該日期活動詳情',
                style: TextStyle(color: Color(0xFFB36AFF), fontSize: 12),
              ),
            ],
          ),
          Text(
            '未加入分會人士，系統自動顯示所有公開活動。',
            style: TextStyle(color: Colors.pink, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 0, 8),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF888B94),
                  fontWeight: FontWeight.bold)),
          CzDivider(
            width: Get.width - 120, // 减去左右边距和标题宽度
          )
        ],
      ),
    );
  }

  // 单个活动卡片，传入 map 数据
  Widget _buildActivityCardItem(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  data['img'] ?? '',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 主标题
                        Expanded(
                          child: Text(
                            data['title'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // 组织名
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            data['org'] ?? '',
                            style: const TextStyle(
                              color: Color(0xFF363140),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          data['category'] ?? '',
                          style: const TextStyle(
                            color: Color(0xFFFFA800),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 4),
                        if (data['canSign'] == true)
                          const Text(
                            '可報名',
                            style: TextStyle(
                              color: Color(0xFFE6004E),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 12,
                      runSpacing: 2,
                      children: [
                        Text('活動時間: ${data['date'] ?? ''}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54)),
                        Text('地點: ${data['location'] ?? ''}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54)),
                        Text('費用: ${data['fee'] ?? ''}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54)),
                        Text('人數: ${data['people'] ?? ''}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54)),
                        Text('主辦分會: ${data['host'] ?? ''}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54)),
                      ],
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 主办机构蓝色链接
              Expanded(
                child: Text(
                  '主辦機構: ${data['org'] ?? ''}',
                  style: const TextStyle(
                    color: Color(0xFF1A73E8),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              // 更多详情按钮
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB36AFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  minimumSize: const Size(0, 18),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text('更多詳情',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ),
              const SizedBox(width: 8),
              // 直接报名按钮
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  minimumSize: const Size(0, 18),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text('直接報名',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
