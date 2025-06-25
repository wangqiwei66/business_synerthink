import 'ai_resp.dart';
import 'calories_summary.dart';
import 'nutrition_summary.dart';
import 'ring_datum.dart';

class FoodSaveAiResultModel {
  List<RingDatum>? ringData;
  NutritionSummary? nutritionSummary;
  AiResp? aiResp;
  CaloriesSummary? caloriesSummary;
  dynamic suggestion;
  bool? warn;
  dynamic dietRecord;

  FoodSaveAiResultModel({
    this.ringData,
    this.nutritionSummary,
    this.aiResp,
    this.caloriesSummary,
    this.suggestion,
    this.warn,
    this.dietRecord,
  });

  @override
  String toString() {
    return 'FoodSaveAiResultModel(ringData: $ringData, nutritionSummary: $nutritionSummary, aiResp: $aiResp, caloriesSummary: $caloriesSummary, suggestion: $suggestion, warn: $warn, dietRecord: $dietRecord)';
  }

  factory FoodSaveAiResultModel.fromJson(Map<String, dynamic> json) {
    return FoodSaveAiResultModel(
      ringData: (json['ring_data'] as List<dynamic>?)
          ?.map((e) => RingDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutritionSummary: json['nutrition_summary'] == null
          ? null
          : NutritionSummary.fromJson(
              json['nutrition_summary'] as Map<String, dynamic>),
      aiResp: json['ai_resp'] == null
          ? null
          : AiResp.fromJson(json['ai_resp'] as Map<String, dynamic>),
      caloriesSummary: json['calories_summary'] == null
          ? null
          : CaloriesSummary.fromJson(
              json['calories_summary'] as Map<String, dynamic>),
      suggestion: json['suggestion'] as dynamic,
      warn: json['warn'] as bool?,
      dietRecord: json['diet_record'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'ring_data': ringData?.map((e) => e.toJson()).toList(),
        'nutrition_summary': nutritionSummary?.toJson(),
        'ai_resp': aiResp?.toJson(),
        'calories_summary': caloriesSummary?.toJson(),
        'suggestion': suggestion,
        'warn': warn,
        'diet_record': dietRecord,
      };
}
