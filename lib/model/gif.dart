import 'package:flutter/material.dart';

class Gif{
  String id;
  String url;
  String title;

  Gif({@required this.id, @required this.url, @required this.title});

  String toString() {
    return toJson().toString();
  }

  factory Gif.fromJson(Map<String, dynamic> json) {
    return Gif(
      id: json["id"],
      url: json["images"]["fixed_height"]["url"],
      title: json["title"]
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'url': url};
  }

  static List<Gif> fillCollection(List json) {
    List<Gif> items = [];

    json.forEach((item) {
      items.add(Gif.fromJson(item));
    });

    return items;
  }

}
