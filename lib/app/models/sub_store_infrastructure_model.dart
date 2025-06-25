import 'dart:convert';

import 'common_model.dart';

class SubStoreInfrastractureModel {
  SubStoreInfrastractureModel(
      {this.id,
      this.typename,
      this.imageUrl,
      this.title,
      this.desciption,
      this.rating});

  String? id;
  String? typename;
  String? imageUrl;
  String? title;
  String? desciption;
  int? rating;

  factory SubStoreInfrastractureModel.fromJson(Map<String, dynamic>? jsonRes) {
    if (jsonRes == null) {
      return SubStoreInfrastractureModel();
    }

    return SubStoreInfrastractureModel(
        id: asT<String?>(jsonRes['id']),
        typename: asT<String?>(jsonRes['typename']),
        imageUrl: asT<String?>(jsonRes['imageUrl']),
        title: asT<String?>(jsonRes['title']),
        desciption: asT<String?>(jsonRes['desciption']),
        rating: asT<int?>(jsonRes['rating']));
  }

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'typename': typename,
        'id': id,
        'imageUrl': imageUrl,
        'title': title,
        'desciption': desciption,
        'rating': rating
      };

  SubStoreInfrastractureModel clone() => SubStoreInfrastractureModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
