class Community {
  int? id;
  String? name;

  Community({this.id, this.name});

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
