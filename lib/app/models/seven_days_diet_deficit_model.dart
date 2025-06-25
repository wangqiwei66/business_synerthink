/// 七天饮食热量缺口模型
class SevenDaysDietDeficitModel {
  final String title;
  final String text;
  final int benchmark;
  final int achievedDays;
  final int totalDays;
  final List<DailyDeficitMetric> dailyMetrics;

  SevenDaysDietDeficitModel({
    required this.title,
    required this.text,
    required this.benchmark,
    required this.achievedDays,
    required this.totalDays,
    required this.dailyMetrics,
  });

  factory SevenDaysDietDeficitModel.fromJson(Map<String, dynamic> json) {
    return SevenDaysDietDeficitModel(
      title: json['title'] ?? '',
      text: json['text'] ?? '',
      benchmark: json['benchmark'] ?? 0,
      achievedDays: json['achieved_days'] ?? 0,
      totalDays: json['total_days'] ?? 0,
      dailyMetrics: (json['daily_metrics'] as List<dynamic>? ?? [])
          .map((e) => DailyDeficitMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// 每日热量缺口数据
class DailyDeficitMetric {
  final String date;
  final int deficit;
  final bool isFastingDay;
  final bool achieved;

  DailyDeficitMetric({
    required this.date,
    required this.deficit,
    required this.isFastingDay,
    required this.achieved,
  });

  factory DailyDeficitMetric.fromJson(Map<String, dynamic> json) {
    return DailyDeficitMetric(
      date: json['date'] ?? '',
      deficit: json['deficit'] ?? 0,
      isFastingDay: json['is_fasting_day'] ?? false,
      achieved: json['achieved'] ?? false,
    );
  }
}
