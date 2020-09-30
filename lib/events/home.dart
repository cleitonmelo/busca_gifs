import 'package:busca_gifs/screens/home/home.dart';
import 'package:busca_gifs/services/api.dart';
import 'package:flutter/material.dart';

class HomeEvents{
  State<Home> state;
  String search;

  HomeEvents(this.state);

  Future<Map> fetchGifs() async{
    if(search == null){
      return await Api.trending().getData();
    }
    return await Api.search(search).getData();
  }
}