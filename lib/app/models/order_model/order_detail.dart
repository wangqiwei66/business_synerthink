class OrderDetail {
  int? createTime;
  int? updateTime;
  String? creator;
  String? updater;
  bool? deleted;
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  double? price;
  String? productName;
  List<String>? mainImg;

  OrderDetail({
    this.createTime,
    this.updateTime,
    this.creator,
    this.updater,
    this.deleted,
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.price,
    this.productName,
    this.mainImg,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        createTime: json['createTime'] as int?,
        updateTime: json['updateTime'] as int?,
        creator: json['creator'] as String?,
        updater: json['updater'] as String?,
        deleted: json['deleted'] as bool?,
        id: json['id'] as int?,
        orderId: json['orderId'] as int?,
        productId: json['productId'] as int?,
        quantity: json['quantity'] as int?,
        price: json['price'] as double?,
        productName: json['productName'] as String?,
        mainImg: (json['mainImg'] as List<dynamic>?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'createTime': createTime,
        'updateTime': updateTime,
        'creator': creator,
        'updater': updater,
        'deleted': deleted,
        'id': id,
        'orderId': orderId,
        'productId': productId,
        'quantity': quantity,
        'price': price,
        'productName': productName,
        'mainImg': mainImg,
      };
}
