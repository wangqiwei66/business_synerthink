import 'check_item.dart';

class StationCheckModel {
  int? id;
  String? name;
  List<CheckItem>? checkItems;

  StationCheckModel({this.id, this.name, this.checkItems});

  factory StationCheckModel.fromJson(Map<String, dynamic> json) {
    return StationCheckModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      checkItems: (json['checkItems'] as List<dynamic>?)
          ?.map((e) => CheckItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'checkItems': checkItems?.map((e) => e.toJson()).toList(),
      };
}
