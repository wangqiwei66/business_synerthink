class SecurityCheckModel {
  final String title;
  String? remark;
  List<String>? photos;
  List<String>? uploadedPhotos;
  List<String>? riskOptions;

  int? selection;
  int? riskSelection;

  SecurityCheckModel({
    required this.title,
    this.remark,
    this.photos,
    this.selection,
    this.riskOptions,
    this.riskSelection,
  });
}
