import 'station.dart';

class StationHierarchyModel {
  List<Station>? stations;

  StationHierarchyModel({this.stations});

  factory StationHierarchyModel.fromJson(Map<String, dynamic> json) {
    return StationHierarchyModel(
      stations: (json['stations'] as List<dynamic>?)
          ?.map((e) => Station.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'stations': stations?.map((e) => e.toJson()).toList(),
      };
}
