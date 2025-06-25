import 'dart:convert';

class SubmitHazardDetail {
  List<String> hazardImage;
  List<String> rectificationImage;
  bool? rectificationStatus;
  bool? assignStatus;
  String? signSnap;
  int? stationId;
  int? checkId;
  int? hazardId;
  int? correctorId;
  int? rectificationTime;

  SubmitHazardDetail(
      {List<String>? hazardImage,
      List<String>? rectificationImage,
      this.rectificationStatus,
      this.assignStatus,
      this.signSnap,
      this.stationId,
      this.checkId,
      this.hazardId,
      this.correctorId,
      this.rectificationTime})
      : hazardImage = hazardImage ?? [],
        rectificationImage = rectificationImage ?? [];

  Map<String, dynamic> toJson() => {
        'hazardImage': hazardImage,
        'rectificationImage': rectificationImage,
        'rectificationStatus': rectificationStatus,
        'assignStatus': assignStatus,
        'signSnap': signSnap,
        'stationId': stationId,
        'checkId': checkId,
        'hazardId': hazardId,
        'correctorId': correctorId,
        'rectificationTime': rectificationTime,
      };

  static SubmitHazardDetail fromJson(Map<String, dynamic> json) =>
      SubmitHazardDetail(
        hazardImage: List<String>.from(json['hazardImage'] ?? []),
        rectificationImage: List<String>.from(json['rectificationImage'] ?? []),
        rectificationStatus: json['rectificationStatus'],
        assignStatus: json['assignStatus'],
        signSnap: json['signSnap'],
        stationId: json['stationId'],
        checkId: json['checkId'],
        hazardId: json['hazardId'],
        correctorId: json['correctorId'],
        rectificationTime: json['rectificationTime'],
      );

  @override
  String toString() => jsonEncode(toJson());

  static SubmitHazardDetail fromString(String source) =>
      fromJson(jsonDecode(source));
}

class SubmitCheckDetail {
  List<String> criticalImage;
  int? status;
  int? checkItemId;
  List<SubmitHazardDetail> hazardDetails;

  SubmitCheckDetail({
    List<String>? criticalImage,
    this.status,
    this.checkItemId,
    List<SubmitHazardDetail>? hazardDetails,
  })  : criticalImage = criticalImage ?? [],
        hazardDetails = hazardDetails ?? [];

  Map<String, dynamic> toJson() => {
        'criticalImage': criticalImage,
        'status': status,
        'checkItemId': checkItemId,
        'hazardDetails': hazardDetails.map((e) => e.toJson()).toList(),
      };

  static SubmitCheckDetail fromJson(Map<String, dynamic> json) =>
      SubmitCheckDetail(
        criticalImage: List<String>.from(json['criticalImage'] ?? []),
        status: json['status'],
        checkItemId: json['checkItemId'],
        hazardDetails: (json['hazardDetails'] as List?)
                ?.map((e) => SubmitHazardDetail.fromJson(e))
                .toList() ??
            [],
      );

  @override
  String toString() => jsonEncode(toJson());

  static SubmitCheckDetail fromString(String source) =>
      fromJson(jsonDecode(source));
}

class SubmitCheckModel {
  int? id;
  String? checkTime;
  String? signSnap;
  int? status;
  int? stationId;
  int? workerId;
  int? customerId;
  bool? isHazardPresent;
  List<SubmitCheckDetail> checkDetails;

  SubmitCheckModel({
    this.id,
    this.checkTime,
    this.signSnap,
    this.status,
    this.stationId,
    this.workerId,
    this.isHazardPresent,
    List<SubmitCheckDetail>? checkDetails,
  }) : checkDetails = checkDetails ?? [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'checkTime': checkTime,
        'signSnap': signSnap,
        'status': status,
        'stationId': stationId,
        'workerId': workerId,
        'customerId': customerId,
        'isHazardPresent': isHazardPresent,
        'checkDetails': checkDetails.map((e) => e.toJson()).toList(),
      };

  static SubmitCheckModel fromJson(Map<String, dynamic> json) =>
      SubmitCheckModel(
        id: json['id'],
        checkTime: json['checkTime'],
        signSnap: json['signSnap'],
        status: json['status'],
        stationId: json['stationId'],
        workerId: json['workerId'],
        isHazardPresent: json['isHazardPresent'],
        checkDetails: (json['checkDetails'] as List?)
                ?.map((e) => SubmitCheckDetail.fromJson(e))
                .toList() ??
            [],
      );

  @override
  String toString() => jsonEncode(toJson());

  static SubmitCheckModel fromString(String source) =>
      fromJson(jsonDecode(source));
}
