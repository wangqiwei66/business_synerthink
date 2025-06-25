class BottleTraceModel {
  int? id;
  String? operatorName;
  int? actionType; //1:入库 2:充装 3:出库 4:配送 5:回收
  String? customerName;
  String? cylinderId;
  int? createTime;
  String? stationName; // 新增的字段

  BottleTraceModel({
    this.id,
    this.operatorName,
    this.actionType,
    this.customerName,
    this.cylinderId,
    this.createTime,
    this.stationName, // 在构造函数中添加
  });

  factory BottleTraceModel.fromJson(Map<String, dynamic> json) {
    return BottleTraceModel(
      id: json['id'] as int?,
      operatorName: json['operatorName'] as String?,
      actionType: json['actionType'] as int?,
      customerName: json['customerName'] as String?,
      cylinderId: json['cylinderId'] as String?,
      createTime: json['createTime'] as int?,
      stationName: json['stationName'] as String?, // 在 fromJson 中解析
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'operatorName': operatorName,
      'actionType': actionType,
      'customerName': customerName,
      'cylinderId': cylinderId,
      'createTime': createTime,
      'stationName': stationName, // 在 toJson 中添加
    };
  }
}
