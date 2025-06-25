/// 七天运动热量数据模型
class SevenDaysExerciseCaloriesModel {
  final String title;
  final String text;
  final int benchmark;
  final int achievedDays;
  final int totalDays;
  final List<ExerciseDailyMetric> dailyMetrics;

  SevenDaysExerciseCaloriesModel({
    required this.title,
    required this.text,
    required this.benchmark,
    required this.achievedDays,
    required this.totalDays,
    required this.dailyMetrics,
  });

  /// 从json解析
  factory SevenDaysExerciseCaloriesModel.fromJson(Map<String, dynamic> json) {
    return SevenDaysExerciseCaloriesModel(
      title: json['title'] as String,
      text: json['text'] as String,
      benchmark: json['benchmark'] as int,
      achievedDays: json['achieved_days'] as int,
      totalDays: json['total_days'] == null ? 0 : json['total_days'] as int,
      dailyMetrics: (json['daily_metrics'] as List<dynamic>)
          .map((e) => ExerciseDailyMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// 单日运动热量数据
class ExerciseDailyMetric {
  final String date;
  final double exerciseCalories;
  final bool achieved;
  final bool isFastingDay;

  ExerciseDailyMetric({
    required this.date,
    required this.exerciseCalories,
    required this.achieved,
    required this.isFastingDay,
  });

  /// 从json解析
  factory ExerciseDailyMetric.fromJson(Map<String, dynamic> json) {
    return ExerciseDailyMetric(
      date: json['date'] as String,
      exerciseCalories: json['exercise_calories'] == null
          ? 0.0
          : (json['exercise_calories'] as num).toDouble(),
      achieved: json['achieved'] == null ? false : json['achieved'] as bool,
      isFastingDay: json['is_fasting_day'] == null
          ? false
          : json['is_fasting_day'] as bool,
    );
  }
}
