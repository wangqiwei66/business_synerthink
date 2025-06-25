import 'dart:ffi';

import 'device.dart';

class CustomerInfoModel {
  int? id;
  String? name;
  String? phone;
  String? certificateno;
  int? type;
  int? createTime;
  int? stationId;
  dynamic stationName;
  List<Device>? devices;
  List<Address>? addresses; // 新增字段
  int selectedAddressIndex = 0; // 新增字段
  bool? isAddressExpanded; // 添加这一行来跟踪地址列表的展开状态

  CustomerInfoModel({
    this.id,
    this.name,
    this.phone,
    this.certificateno,
    this.type,
    this.createTime,
    this.stationId,
    this.stationName,
    this.devices,
    this.addresses, // 新增字段
    this.selectedAddressIndex = 0, // 新增字段
  });

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) {
    return CustomerInfoModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      certificateno: json['certificateno'] as String?,
      type: json['type'] as int?,
      createTime: json['createTime'] as int?,
      stationId: json['stationId'] as int?,
      stationName: json['stationName'] as dynamic,
      devices: (json['devices'] as List<dynamic>?)
          ?.map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      addresses: (json['addresses'] as List<dynamic>?) // 新增字段解析
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'certificateno': certificateno,
        'type': type,
        'createTime': createTime,
        'stationId': stationId,
        'stationName': stationName,
        'devices': devices?.map((e) => e.toJson()).toList(),
        'addresses': addresses?.map((e) => e.toJson()).toList(), // 新增字段转换
      };
}

// 假设 Address 类已经定义
class Address {
  int? type;
  int? streetId;
  String? streetName;
  String? communityName;
  int? communityId;
  String? detailAddr;
  double? longitude;
  double? latitude;

  Address({
    this.type = 1, // 只在构造函数中设置默认值即可
    this.streetId,
    this.communityId,
    this.detailAddr,
    this.longitude,
    this.latitude,
    this.streetName, // 新增字段
    this.communityName, // 新增字段
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      type: json['type'] as int?,
      streetId: json['streetId'] as int?,
      communityId: json['communityId'] as int?,
      detailAddr: json['detailAddr'] as String?,
      longitude: json['longitude'] as double?,
      latitude: json['latitude'] as double?,
      streetName: json['streetName'] as String?, // 新增字段
      communityName: json['communityName'] as String?, // 新增字段
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'streetId': streetId,
        'communityId': communityId,
        'detailAddr': detailAddr,
        'longitude': longitude,
        'latitude': latitude,
        'streetName': streetName, // 新增字段
        'communityName': communityName, // 新增字段
      };
}
