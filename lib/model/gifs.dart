import 'package:flutter/material.dart';

class Gifs{
  String id;
  String url;
  String title;

  Gifs({@required this.id, @required this.url, @required this.title});

  String toString() {
    return toJson().toString();
  }

  factory Gifs.fromJson(Map<String, dynamic> json) {
    return Gifs(
      id: json["id"],
      url: json["images"]["fixed_height"]["url"],
      title: json["title"]
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'url': url};
  }

  static List<Gifs> fillCollection(List json) {
    List<Gifs> items = [];

    json.forEach((item) {
      items.add(Gifs.fromJson(item));
    });

    return items;
  }

}
