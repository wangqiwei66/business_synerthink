class ProductModel {
  int? id;
  int? stationId;
  String? name;
  int? type;
  double? supplyPrice;
  double? salePrice;
  int? promotion;
  double? promotionPrice;
  int? status;
  List<String>? mainImg;
  List<String>? detailImg;
  String? outline;
  String? description;
  String? remark;
  int? soldAmount;
  int? createTime;
  int count = 1;

  ProductModel({
    this.id,
    this.stationId,
    this.name,
    this.type,
    this.supplyPrice,
    this.salePrice,
    this.promotion,
    this.promotionPrice,
    this.status,
    this.mainImg,
    this.detailImg,
    this.outline,
    this.description,
    this.remark,
    this.soldAmount,
    this.createTime,
    this.count = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        stationId: json['stationId'] as int?,
        name: json['name'] as String?,
        type: json['type'] as int?,
        supplyPrice: json['supplyPrice'] as double?,
        salePrice: json['salePrice'] as double?,
        promotion: json['promotion'] as int?,
        promotionPrice: json['promotionPrice'] as double?,
        status: json['status'] as int?,
        mainImg: (json['mainImg'] as List<dynamic>?)?.cast<String>(),
        detailImg: (json['detailImg'] as List<dynamic>?)?.cast<String>(),
        outline: json['outline'] as String?,
        description: json['description'] as String?,
        remark: json['remark'] as String?,
        soldAmount: json['soldAmount'] as int?,
        createTime: json['createTime'] as int?,
        count: 1,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'stationId': stationId,
        'name': name,
        'type': type,
        'supplyPrice': supplyPrice,
        'salePrice': salePrice,
        'promotion': promotion,
        'promotionPrice': promotionPrice,
        'status': status,
        'mainImg': mainImg,
        'detailImg': detailImg,
        'outline': outline,
        'description': description,
        'remark': remark,
        'soldAmount': soldAmount,
        'createTime': createTime,
        'count': count,
      };

  double get realPrice {
    if (promotion == 1) {
      return promotionPrice ?? 0.0;
    } else {
      return salePrice ?? 0.0;
    }
  }
}
