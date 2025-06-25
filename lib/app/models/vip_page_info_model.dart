/// VIP页面信息数据模型
class VipPageInfoModel {
  final List<VipScrollItem> scroll;
  final List<VipGoodsItem> goods;
  final List<VipCommentItem> comments;
  final List<String> pics;

  VipPageInfoModel({
    required this.scroll,
    required this.goods,
    required this.comments,
    required this.pics,
  });

  factory VipPageInfoModel.fromJson(Map<String, dynamic> json) {
    return VipPageInfoModel(
      scroll: (json['scroll'] as List<dynamic>?)
              ?.map((e) => VipScrollItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      goods: (json['goods'] as List<dynamic>?)
              ?.map((e) => VipGoodsItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => VipCommentItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pics: (json['pics'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

/// 滚动用户信息
class VipScrollItem {
  final int id;
  final String name;
  final String avatar;
  final String descEffect;
  final int vipDays;
  final bool status;
  final String createdAt;
  final String updatedAt;

  VipScrollItem({
    required this.id,
    required this.name,
    required this.avatar,
    required this.descEffect,
    required this.vipDays,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VipScrollItem.fromJson(Map<String, dynamic> json) {
    return VipScrollItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      descEffect: json['desc_effect'] ?? '',
      vipDays: json['vip_days'] ?? 0,
      status: json['status'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

/// 商品信息
class VipGoodsItem {
  final int id;
  final String name;
  final String nameTag;
  final String desc;
  final int goodsType;
  final double discount;
  final double price;
  final String priceTag;
  final String priceDesc; // 新增字段：价格描述
  final int sort;
  final bool status;
  final String createdAt;
  final String updatedAt;

  /// 构造函数，新增 priceDesc 字段
  VipGoodsItem({
    required this.id,
    required this.name,
    required this.nameTag,
    required this.desc,
    required this.goodsType,
    required this.discount,
    required this.price,
    required this.priceTag,
    required this.priceDesc, // 新增字段
    required this.sort,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 从 JSON 构建 VipGoodsItem 实例，支持 price_desc 字段
  factory VipGoodsItem.fromJson(Map<String, dynamic> json) {
    return VipGoodsItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      nameTag: json['name_tag'] ?? '',
      desc: (json['desc'] ?? ''),
      goodsType: json['goods_type'] ?? 0,
      discount: (json['discount'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toDouble(),
      priceTag: json['price_tag'] ?? '',
      priceDesc: json['price_desc'] ?? '', // 新增字段
      sort: json['sort'] ?? 0,
      status: json['status'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

/// 用户评论
class VipCommentItem {
  final int id;
  final int star;
  final String content;
  final String userName;
  final String from; // 新增字段：评论来源
  final int sort;
  final bool status;
  final String createdAt;
  final String updatedAt;

  /// 构造函数，新增 from 字段
  VipCommentItem({
    required this.id,
    required this.star,
    required this.content,
    required this.userName,
    required this.from, // 新增字段
    required this.sort,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 从 JSON 构建 VipCommentItem 实例，支持 from 字段
  factory VipCommentItem.fromJson(Map<String, dynamic> json) {
    return VipCommentItem(
      id: json['id'] ?? 0,
      star: json['star'] ?? 0,
      content:
          (json['content'] ?? ''), //.replaceAll(r'\n', '\n'), // 替换换行符为空格,,
      userName: json['user_name'] ?? '',
      from: json['from'] ?? '', // 新增字段
      sort: json['sort'] ?? 0,
      status: json['status'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
