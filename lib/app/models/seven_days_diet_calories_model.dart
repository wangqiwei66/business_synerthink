/// 七天饮食热量数据模型
class SevenDaysDietCaloriesModel {
  final String title;
  final String text;
  final int benchmark;
  final int overDays;
  final int dataCount;
  final List<DailyMetric> dailyMetrics;

  SevenDaysDietCaloriesModel({
    required this.title,
    required this.text,
    required this.benchmark,
    required this.overDays,
    required this.dataCount,
    required this.dailyMetrics,
  });

  /// 从json解析
  factory SevenDaysDietCaloriesModel.fromJson(Map<String, dynamic> json) {
    return SevenDaysDietCaloriesModel(
      title: json['title'] as String,
      text: json['text'] as String,
      benchmark: json['benchmark'] as int,
      overDays: json['over_days'] as int,
      dataCount: json['data_count'] as int,
      dailyMetrics: (json['daily_metrics'] as List<dynamic>)
          .map((e) => DailyMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// 单日饮食热量数据
class DailyMetric {
  final String date;
  final int calories;
  final int isOver;
  final bool isFastingDay;

  DailyMetric({
    required this.date,
    required this.calories,
    required this.isOver,
    required this.isFastingDay,
  });

  /// 从json解析
  factory DailyMetric.fromJson(Map<String, dynamic> json) {
    return DailyMetric(
      date: json['date'] as String,
      calories: json['calories'] as int,
      isOver: json['is_over'] as int,
      isFastingDay: json['is_fasting_day'] as bool,
    );
  }
}
