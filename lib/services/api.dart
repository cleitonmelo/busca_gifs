import 'dart:convert';

import 'package:http/http.dart' as http;

class Api{
  static const BASE_URL = "https://api.giphy.com/v1/gifs";
  static const API_KEY = "QkVlgVSIFnXi0bHsBzhV4LRDFOrR6p1d";
  static const DEFAULT_LIMIT = 19;
  static const DEFAULT_LANG = "pt";
  static const DEFAULT_RANTING = "g";

  static const TYPE_SEARCH = "search";
  static const TYPE_TRENDING = "trending";

  String type;
  String limit;
  int offset;
  String lang;
  String search;

  Api({this.type, this.offset, this.search, this.limit, this.lang});

  bool isTypeSearch() => this.type == TYPE_SEARCH;
  bool isTypeTrending() => this.type == TYPE_TRENDING;

  String getLimit(){
    return this.limit == null ? DEFAULT_LIMIT.toString() : this.limit;
  }

  String getLang(){
    return this.lang == null ? DEFAULT_LANG : this.lang;
  }

  String getType(){
    return isTypeTrending() ? TYPE_TRENDING : TYPE_SEARCH;
  }

  String get url{
    String params = "api_key=$API_KEY&limit=${getLimit()}&rating=g";
    if (isTypeSearch()){
      params += "&offset=${offset ?? 0 }&q=$search&lang=${getLang()}";
    }
    return "$BASE_URL/$type?$params";
  }

  String getUrl(){
    return url;
  }

  Future<Map<String, dynamic>> getData() async {
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  factory Api.trending({offset}) {
    return Api(type: 'trending', offset: offset ?? 0);
  }

  factory Api.search(search, {offset}) {
    return Api(type: 'search', search: search, offset: offset ?? 0);
  }

}