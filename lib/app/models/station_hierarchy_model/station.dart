import 'street.dart';

class Station {
  int? id;
  String? name;
  List<Street>? streets;

  Station({this.id, this.name, this.streets});

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json['id'] as int?,
        name: json['name'] as String?,
        streets: (json['streets'] as List<dynamic>?)
            ?.map((e) => Street.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'streets': streets?.map((e) => e.toJson()).toList(),
      };
}
