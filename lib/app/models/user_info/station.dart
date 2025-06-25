class Station {
  final int id;
  final String name;
  final int type;
  final int parentId;

  Station({
    required this.id,
    required this.name,
    required this.type,
    required this.parentId,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      parentId: json['parentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'parentId': parentId,
    };
  }
}
