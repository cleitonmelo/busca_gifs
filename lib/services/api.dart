import 'dart:convert';

import 'package:http/http.dart' as http;

class Api{
  static const BASE_URL = "https://api.giphy.com/v1/gifs";
  static const API_KEY = "QkVlgVSIFnXi0bHsBzhV4LRDFOrR6p1d";
  static const DEFAULT_LIMIT = "20";
  static const DEFAULT_LANG = "pt";
  static const DEFAULT_RANTING = "g";

  static const TYPE_SEARCH = "search";
  static const TYPE_TRENDING = "trending";

  String type;
  String limit;
  int offset;
  String lang;
  String q;

  Api({this.type, this.offset, this.q, this.limit, this.lang});

  bool isTypeSearch() => this.type == TYPE_SEARCH;
  bool isTypeTrending() => this.type == TYPE_TRENDING;

  String getLimit(){
    return this.limit.isEmpty ? DEFAULT_LIMIT : this.limit;
  }

  String getLang(){
    return this.lang.isEmpty ? DEFAULT_LANG : this.lang;
  }

  String getType(){
    return isTypeTrending() ? TYPE_TRENDING : TYPE_SEARCH;
  }

  String get url{
    String params = "api_key=$API_KEY&limit=${getLimit()}&rating=g";

    if (isTypeSearch()){
      params += "&offset=${offset ?? 0 }&q=$q";
    }
    return "$BASE_URL/$params";
  }

  Future<Map<String, dynamic>> getData() async {

    print("Aqui");

    // http.Response response = await http.get(url);
    // return json.decode(response.body);
  }

  factory Api.trending({offset}) {
    return Api(type: 'trending', offset: offset ?? 0);
  }

  factory Api.search(term, {offset}) {
    return Api(type: 'search', q: term, offset: offset ?? 0);
  }

}