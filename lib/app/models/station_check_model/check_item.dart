import 'hazard.dart';

class CheckItem {
  int? id;
  String? name;
  List<Hazard>? hazards;
  String? remark;
  List<String>? photos;
  List<String>? uploadedPhotos;
  bool? isCritical;

  int? selection;
  CheckItem({this.id, this.name, this.hazards, this.isCritical});

  factory CheckItem.fromJson(Map<String, dynamic> json) => CheckItem(
        id: json['id'] as int?,
        name: json['name'] as String?,
        isCritical: json['isCritical'] as bool?,
        hazards: (json['hazards'] as List<dynamic>?)
            ?.map((e) => Hazard.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isCritical': isCritical,
        'hazards': hazards?.map((e) => e.toJson()).toList(),
      };
}
