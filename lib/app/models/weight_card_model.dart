import 'package:tiny_weight/app/models/common_model.dart';

/// 体重卡片数据模型
class WeightCardModel {
  final String title;
  final List<double> weights;
  final String? text;
  final double initialWeight;
  final double latestWeight;
  final double targetWeight;

  WeightCardModel({
    required this.title,
    required this.weights,
    this.text,
    required this.initialWeight,
    required this.latestWeight,
    required this.targetWeight,
  });

  /// 从JSON解析为模型对象
  factory WeightCardModel.fromJson(Map<String, dynamic> json) {
    return WeightCardModel(
      title: safeCast<String>(json['title']),
      weights: (json['weights'] as List<dynamic>)
          .map((e) => safeCast<double>(e))
          .toList(),
      text: safeCast<String>(json['text']),
      initialWeight: safeCast<double>(json['initial_weight']),
      latestWeight: safeCast<double>(json['latest_weight']),
      targetWeight: safeCast<double>(json['target_weight']),
    );
  }
}
