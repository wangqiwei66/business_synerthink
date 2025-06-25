import 'check_data.dart';

class HazardModel {
  int? id;
  List<String>? hazardImage;
  dynamic remark;
  int? rectificationTime;
  List<String>? rectificationImage;
  bool? rectificationStatus;
  int? rectificationDays;
  bool? assignStatus;
  dynamic signSnap;
  int? createTime;
  int? stationId;
  String? stationName;
  int? checkId;
  HazardCheckData? checkData;
  int? checkItemId;
  String? checkItemName;
  int? hazardId;
  String? hazardName;
  int? workerId;
  String? workerName;
  int? correctorId;
  dynamic correctorName;
  int? hazardLevel;

  HazardModel({
    this.id,
    this.hazardImage,
    this.remark,
    this.rectificationTime,
    this.rectificationImage,
    this.rectificationStatus,
    this.rectificationDays,
    this.assignStatus,
    this.signSnap,
    this.createTime,
    this.stationId,
    this.stationName,
    this.checkId,
    this.checkData,
    this.checkItemId,
    this.checkItemName,
    this.hazardId,
    this.hazardName,
    this.workerId,
    this.workerName,
    this.correctorId,
    this.correctorName,
    this.hazardLevel,
  });

  factory HazardModel.fromJson(Map<String, dynamic> json) => HazardModel(
        id: json['id'] as int?,
        hazardImage: (json['hazardImage'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        remark: json['remark'] as dynamic,
        rectificationTime: json['rectificationTime'] as int?,
        rectificationImage: json['rectificationImage'] != null
            ? List<String>.from(json['rectificationImage'])
            : null,
        rectificationStatus: json['rectificationStatus'] as bool?,
        rectificationDays: json['rectificationDays'] as int?,
        assignStatus: json['assignStatus'] as bool?,
        signSnap: json['signSnap'] as dynamic,
        createTime: json['createTime'] as int?,
        stationId: json['stationId'] as int?,
        stationName: json['stationName'] as String?,
        checkId: json['checkId'] as int?,
        checkData: json['checkData'] == null
            ? null
            : HazardCheckData.fromJson(
                json['checkData'] as Map<String, dynamic>),
        checkItemId: json['checkItemId'] as int?,
        checkItemName: json['checkItemName'] as String?,
        hazardId: json['hazardId'] as int?,
        hazardName: json['hazardName'] as String?,
        workerId: json['workerId'] as int?,
        workerName: json['workerName'] as String?,
        correctorId: json['correctorId'] as int?,
        correctorName: json['correctorName'] as dynamic,
        hazardLevel: json['hazardLevel'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'hazardImage': hazardImage,
        'remark': remark,
        'rectificationTime': rectificationTime,
        'rectificationImage': rectificationImage,
        'rectificationStatus': rectificationStatus,
        'rectificationDays': rectificationDays,
        'assignStatus': assignStatus,
        'signSnap': signSnap,
        'createTime': createTime,
        'stationId': stationId,
        'stationName': stationName,
        'checkId': checkId,
        'checkData': checkData?.toJson(),
        'checkItemId': checkItemId,
        'checkItemName': checkItemName,
        'hazardId': hazardId,
        'hazardName': hazardName,
        'workerId': workerId,
        'workerName': workerName,
        'correctorId': correctorId,
        'correctorName': correctorName,
        'hazardLevel': hazardLevel,
      };
}
