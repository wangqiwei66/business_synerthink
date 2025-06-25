import 'package:flutter/foundation.dart';

class SubStoreListModel {
  int? total;
  List<SubStoreDetailModel>? list;
  int? pageNum;
  int? pageSize;
  int? size;
  int? startRow;
  int? endRow;
  int? pages;
  int? prePage;
  int? nextPage;
  bool? isFirstPage;
  bool? isLastPage;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? navigatePages;
  List<int>? navigatepageNums;
  int? navigateFirstPage;
  int? navigateLastPage;

  SubStoreListModel(
      {this.total,
      this.list,
      this.pageNum,
      this.pageSize,
      this.size,
      this.startRow,
      this.endRow,
      this.pages,
      this.prePage,
      this.nextPage,
      this.isFirstPage,
      this.isLastPage,
      this.hasPreviousPage,
      this.hasNextPage,
      this.navigatePages,
      this.navigatepageNums,
      this.navigateFirstPage,
      this.navigateLastPage});

  SubStoreListModel.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["list"] is List) {
      list = json["list"] == null
          ? null
          : (json["list"] as List)
              .map((e) => SubStoreDetailModel.fromJson(e))
              .toList();
    }
    if (json["pageNum"] is int) {
      pageNum = json["pageNum"];
    }
    if (json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["startRow"] is int) {
      startRow = json["startRow"];
    }
    if (json["endRow"] is int) {
      endRow = json["endRow"];
    }
    if (json["pages"] is int) {
      pages = json["pages"];
    }
    if (json["prePage"] is int) {
      prePage = json["prePage"];
    }
    if (json["nextPage"] is int) {
      nextPage = json["nextPage"];
    }
    if (json["isFirstPage"] is bool) {
      isFirstPage = json["isFirstPage"];
    }
    if (json["isLastPage"] is bool) {
      isLastPage = json["isLastPage"];
    }
    if (json["hasPreviousPage"] is bool) {
      hasPreviousPage = json["hasPreviousPage"];
    }
    if (json["hasNextPage"] is bool) {
      hasNextPage = json["hasNextPage"];
    }
    if (json["navigatePages"] is int) {
      navigatePages = json["navigatePages"];
    }
    if (json["navigatepageNums"] is List) {
      navigatepageNums = json["navigatepageNums"] == null
          ? null
          : List<int>.from(json["navigatepageNums"]);
    }
    if (json["navigateFirstPage"] is int) {
      navigateFirstPage = json["navigateFirstPage"];
    }
    if (json["navigateLastPage"] is int) {
      navigateLastPage = json["navigateLastPage"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    if (list != null) {
      data["list"] = list?.map((e) => e.toJson()).toList();
    }
    data["pageNum"] = pageNum;
    data["pageSize"] = pageSize;
    data["size"] = size;
    data["startRow"] = startRow;
    data["endRow"] = endRow;
    data["pages"] = pages;
    data["prePage"] = prePage;
    data["nextPage"] = nextPage;
    data["isFirstPage"] = isFirstPage;
    data["isLastPage"] = isLastPage;
    data["hasPreviousPage"] = hasPreviousPage;
    data["hasNextPage"] = hasNextPage;
    data["navigatePages"] = navigatePages;
    if (navigatepageNums != null) {
      data["navigatepageNums"] = navigatepageNums;
    }
    data["navigateFirstPage"] = navigateFirstPage;
    data["navigateLastPage"] = navigateLastPage;
    return data;
  }
}

class SubStoreDetailModel {
  String? id;
  String? createAt;
  String? updateAt;
  String? name;
  String? avatar;
  String? subname;
  String? address;
  String? latitude;
  String? longitude;
  String? description;
  String? contact;
  String? url;
  int? state;
  int? distance;
  bool? deleted;
  List<SubStoreCoupons>? coupons;
  List<SubStoreDevices>? devices;
  List<SubStoreImages>? images;
  String? createAtStr;
  String? updateAtStr;

  SubStoreDetailModel(
      {this.id,
      this.createAt,
      this.updateAt,
      this.name,
      this.avatar,
      this.subname,
      this.address,
      this.latitude,
      this.longitude,
      this.description,
      this.contact,
      this.state,
      this.distance,
      this.deleted,
      this.coupons,
      this.devices,
      this.images,
      this.createAtStr,
      this.updateAtStr,
      this.url});

  SubStoreDetailModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["createAt"] is String) {
      createAt = json["createAt"];
    }
    if (json["updateAt"] is String) {
      updateAt = json["updateAt"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["subname"] is String) {
      subname = json["subname"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["latitude"] is String) {
      latitude = json["latitude"];
    }
    if (json["longitude"] is String) {
      longitude = json["longitude"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["contact"] is String) {
      contact = json["contact"];
    }
    if (json["state"] is int) {
      state = json["state"];
    }

    if (json["distance"] is int) {
      distance = json["distance"];
    }
    if (json["deleted"] is bool) {
      deleted = json["deleted"];
    }
    if (json["coupons"] is List) {
      coupons = json["coupons"] == null
          ? null
          : (json["coupons"] as List)
              .map((e) => SubStoreCoupons.fromJson(e))
              .toList();
    }
    if (json["devices"] is List) {
      devices = json["devices"] == null
          ? null
          : (json["devices"] as List)
              .map((e) => SubStoreDevices.fromJson(e))
              .toList();
    }
    if (json["images"] is List) {
      images = json["images"] == null
          ? null
          : (json["images"] as List)
              .map((e) => SubStoreImages.fromJson(e))
              .toList();
    }
    if (json["createAtStr"] is String) {
      createAtStr = json["createAtStr"];
    }
    if (json["updateAtStr"] is String) {
      updateAtStr = json["updateAtStr"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["createAt"] = createAt;
    data["updateAt"] = updateAt;
    data["name"] = name;
    data["avatar"] = avatar;
    data["subname"] = subname;
    data["address"] = address;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["description"] = description;
    data["contact"] = contact;
    data["distance"] = distance;
    data["state"] = state;
    data["deleted"] = deleted;
    if (coupons != null) {
      data["coupons"] = coupons?.map((e) => e.toJson()).toList();
    }
    if (devices != null) {
      data["devices"] = devices?.map((e) => e.toJson()).toList();
    }
    if (images != null) {
      data["images"] = images?.map((e) => e.toJson()).toList();
    }
    data["createAtStr"] = createAtStr;
    data["updateAtStr"] = updateAtStr;
    data["url"] = url;
    return data;
  }
}

class SubStoreImages {
  String? id;
  String? createAt;
  String? updateAt;
  String? storeId;
  String? url;
  String? type;
  String? name;
  String? description;
  bool? deleted;
  String? createAtStr;
  String? updateAtStr;

  SubStoreImages(
      {this.id,
      this.createAt,
      this.updateAt,
      this.storeId,
      this.url,
      this.type,
      this.name,
      this.description,
      this.deleted,
      this.createAtStr,
      this.updateAtStr});

  SubStoreImages.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["createAt"] is String) {
      createAt = json["createAt"];
    }
    if (json["updateAt"] is String) {
      updateAt = json["updateAt"];
    }
    if (json["storeId"] is String) {
      storeId = json["storeId"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["deleted"] is bool) {
      deleted = json["deleted"];
    }
    if (json["createAtStr"] is String) {
      createAtStr = json["createAtStr"];
    }
    if (json["updateAtStr"] is String) {
      updateAtStr = json["updateAtStr"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["createAt"] = createAt;
    data["updateAt"] = updateAt;
    data["storeId"] = storeId;
    data["url"] = url;
    data["type"] = type;
    data["name"] = name;
    data["description"] = description;
    data["deleted"] = deleted;
    data["createAtStr"] = createAtStr;
    data["updateAtStr"] = updateAtStr;
    return data;
  }
}

class SubStoreDevices {
  String? id;
  String? createAt;
  String? updateAt;
  String? storeId;
  String? avatar;
  String? name;
  int? popularity;
  String? description;
  int? state;
  bool? deleted;
  String? createAtStr;
  String? updateAtStr;

  SubStoreDevices(
      {this.id,
      this.createAt,
      this.updateAt,
      this.storeId,
      this.avatar,
      this.name,
      this.popularity,
      this.description,
      this.state,
      this.deleted,
      this.createAtStr,
      this.updateAtStr});

  SubStoreDevices.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["createAt"] is String) {
      createAt = json["createAt"];
    }
    if (json["updateAt"] is String) {
      updateAt = json["updateAt"];
    }
    if (json["storeId"] is String) {
      storeId = json["storeId"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["popularity"] is int) {
      popularity = json["popularity"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["state"] is int) {
      state = json["state"];
    }
    if (json["deleted"] is bool) {
      deleted = json["deleted"];
    }
    if (json["createAtStr"] is String) {
      createAtStr = json["createAtStr"];
    }
    if (json["updateAtStr"] is String) {
      updateAtStr = json["updateAtStr"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["createAt"] = createAt;
    data["updateAt"] = updateAt;
    data["storeId"] = storeId;
    data["avatar"] = avatar;
    data["name"] = name;
    data["popularity"] = popularity;
    data["description"] = description;
    data["state"] = state;
    data["deleted"] = deleted;
    data["createAtStr"] = createAtStr;
    data["updateAtStr"] = updateAtStr;
    return data;
  }
}

class SubStoreCoupons {
  String? id;
  String? createAt;
  String? updateAt;
  String? couponTypeId;
  String? storeId;
  int? state;
  String? description;
  String? enableAt;
  String? expireAt;
  bool? deleted;
  String? createAtStr;
  String? updateAtStr;

  SubStoreCoupons(
      {this.id,
      this.createAt,
      this.updateAt,
      this.couponTypeId,
      this.storeId,
      this.state,
      this.description,
      this.enableAt,
      this.expireAt,
      this.deleted,
      this.createAtStr,
      this.updateAtStr});

  SubStoreCoupons.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["createAt"] is String) {
      createAt = json["createAt"];
    }
    if (json["updateAt"] is String) {
      updateAt = json["updateAt"];
    }
    if (json["couponTypeId"] is String) {
      couponTypeId = json["couponTypeId"];
    }
    if (json["storeId"] is String) {
      storeId = json["storeId"];
    }
    if (json["state"] is int) {
      state = json["state"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["enableAt"] is String) {
      enableAt = json["enableAt"];
    }
    if (json["expireAt"] is String) {
      expireAt = json["expireAt"];
    }
    if (json["deleted"] is bool) {
      deleted = json["deleted"];
    }
    if (json["createAtStr"] is String) {
      createAtStr = json["createAtStr"];
    }
    if (json["updateAtStr"] is String) {
      updateAtStr = json["updateAtStr"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["createAt"] = createAt;
    data["updateAt"] = updateAt;
    data["couponTypeId"] = couponTypeId;
    data["storeId"] = storeId;
    data["state"] = state;
    data["description"] = description;
    data["enableAt"] = enableAt;
    data["expireAt"] = expireAt;
    data["deleted"] = deleted;
    data["createAtStr"] = createAtStr;
    data["updateAtStr"] = updateAtStr;
    return data;
  }
}
