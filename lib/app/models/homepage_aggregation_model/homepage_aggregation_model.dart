import 'package:tiny_weight/app/models/home_activity_model/home_activity_model.dart';
import 'package:tiny_weight/app/models/meal_collection_model/meal_collection_model.dart';
import 'package:tiny_weight/app/models/today_sport_model.dart';

class HomepageAggregationModel {
  List<HomeCardModel>? card;
  TodaySportModel? todaySports;
  MealCollectionModel? mealData;

  HomepageAggregationModel({this.card, this.todaySports, this.mealData});

  factory HomepageAggregationModel.fromJson(Map<String, dynamic> json) {
    return HomepageAggregationModel(
      card: (json['card'] as List<dynamic>?)
          ?.map((e) => HomeCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      todaySports: json['today_sports'] == null
          ? null
          : TodaySportModel.fromJson(
              json['today_sports'] as Map<String, dynamic>),
      mealData: json['meal_data'] == null
          ? null
          : MealCollectionModel.fromJson(
              json['meal_data'] as Map<String, dynamic>),
    );
  }
}
