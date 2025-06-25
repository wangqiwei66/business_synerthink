import 'package:tiny_weight/app/models/home_page_ring_data_model/homepage/food_save_ai_result_model/ai_nutrition_summary.dart';

import 'food_detail.dart';

class AiResp {
  String? foodText;
  List<FoodDetail>? foodDetails;
  AINutritionSummary? nutritionSummary;
  dynamic analysisFailed;
  int? totalCalories;

  AiResp({
    this.foodText,
    this.foodDetails,
    this.nutritionSummary,
    this.analysisFailed,
    this.totalCalories,
  });

  @override
  String toString() {
    return 'AiResp(foodText: $foodText, foodDetails: $foodDetails, nutritionSummary: $nutritionSummary, analysisFailed: $analysisFailed, totalCalories: $totalCalories)';
  }

  factory AiResp.fromJson(Map<String, dynamic> json) => AiResp(
        foodText: json['food_text'] as String?,
        foodDetails: (json['food_details'] as List<dynamic>?)
            ?.map((e) => FoodDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
        nutritionSummary: json['nutrition_summary'] == null
            ? null
            : AINutritionSummary.fromJson(
                json['nutrition_summary'] as Map<String, dynamic>),
        analysisFailed: json['analysis_failed'] as dynamic,
        totalCalories: json['total_calories'] == null
            ? null
            : (json['total_calories'] as num).toInt(),
      );

  Map<String, dynamic> toJson() => {
        'food_text': foodText,
        'food_details': foodDetails?.map((e) => e.toJson()).toList(),
        'nutrition_summary': nutritionSummary?.toJson(),
        'analysis_failed': analysisFailed,
        'total_calories': totalCalories,
      };
}
