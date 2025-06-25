// ignore_for_file: empty_catches

import 'dart:convert';

import 'common_model.dart';

class NotificationModel {
  NotificationModel(
      {this.id,
      this.typename,
      this.imageUrl,
      this.title,
      this.desciption,
      this.date,
      this.readed});

  String? id;
  String? typename;
  String? imageUrl;
  String? title;
  String? desciption;
  String? date;
  bool? readed = false;

  factory NotificationModel.fromJson(Map<String, dynamic>? jsonRes) {
    if (jsonRes == null) {
      return NotificationModel();
    }

    return NotificationModel(
        id: asT<String?>(jsonRes['id']),
        typename: asT<String?>(jsonRes['typename']),
        imageUrl: asT<String?>(jsonRes['imageUrl']),
        title: asT<String?>(jsonRes['title']),
        desciption: asT<String?>(jsonRes['desciption']),
        date: asT<String?>(jsonRes['date']),
        readed: false);
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
        'description': desciption,
        'date': date,
        'readed': readed
      };

  NotificationModel clone() => NotificationModel.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
