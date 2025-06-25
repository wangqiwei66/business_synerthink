import 'community.dart';

class Street {
  int? id;
  String? name;
  List<Community>? communities;

  Street({this.id, this.name, this.communities});

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        id: json['id'] as int?,
        name: json['name'] as String?,
        communities: (json['communities'] as List<dynamic>?)
            ?.map((e) => Community.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'communities': communities?.map((e) => e.toJson()).toList(),
      };
}
