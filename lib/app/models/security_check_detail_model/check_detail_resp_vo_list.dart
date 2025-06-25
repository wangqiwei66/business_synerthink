import 'hazard_detail_resp_vo_list.dart';

class CheckDetailRespVoList {
  int? id;
  List<String>? criticalImage;
  int? status;
  int? createTime;
  int? stationId;
  String? stationName;
  int? checkId;
  int? checkItemId;
  String? checkItemName;
  bool? isCritical;
  List<HazardDetailRespVoList>? hazardDetailRespVoList;
  bool isExpanded; // 添加字段来保存折叠状态

  CheckDetailRespVoList({
    this.id,
    this.criticalImage,
    this.status,
    this.createTime,
    this.stationId,
    this.stationName,
    this.checkId,
    this.checkItemId,
    this.checkItemName,
    this.isCritical,
    this.hazardDetailRespVoList,
    this.isExpanded = false, // 默认折叠
  });

  factory CheckDetailRespVoList.fromJson(Map<String, dynamic> json) {
    return CheckDetailRespVoList(
      id: json['id'] as int?,
      criticalImage: (json['criticalImage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as int?,
      createTime: json['createTime'] as int?,
      stationId: json['stationId'] as int?,
      stationName: json['stationName'] as String?,
      checkId: json['checkId'] as int?,
      checkItemId: json['checkItemId'] as int?,
      checkItemName: json['checkItemName'] as String?,
      isCritical: json['isCritical'] as bool?,
      hazardDetailRespVoList: (json['hazardDetailRespVOList'] as List<dynamic>?)
          ?.map(
              (e) => HazardDetailRespVoList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'criticalImage': criticalImage,
        'status': status,
        'createTime': createTime,
        'stationId': stationId,
        'stationName': stationName,
        'checkId': checkId,
        'checkItemId': checkItemId,
        'checkItemName': checkItemName,
        'isCritical': isCritical,
        'hazardDetailRespVOList':
            hazardDetailRespVoList?.map((e) => e.toJson()).toList(),
      };
}
