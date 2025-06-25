class Hazard {
  int? id;
  String? name;
  int? rectificationDays;
  bool isSelected = false;
  List<String>? photos;
  List<String>? uploadedPhotos;

  Hazard({this.id, this.name, this.rectificationDays});

  @override
  String toString() =>
      'Hazard(id: $id, name: $name, rectificationDays: $rectificationDays, isSelected: $isSelected, photos: $photos, uploadedPhotos: $uploadedPhotos)';

  factory Hazard.fromJson(Map<String, dynamic> json) => Hazard(
        id: json['id'] as int?,
        name: json['name'] as String?,
        rectificationDays: json['rectificationDays'] as int? ?? 3,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rectificationDays': rectificationDays,
      };
}
