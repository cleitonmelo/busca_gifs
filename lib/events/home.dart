import 'package:busca_gifs/components/loading.dart';
import 'package:busca_gifs/model/gifs.dart';
import 'package:busca_gifs/screens/home/grid.dart';
import 'package:busca_gifs/screens/home/home.dart';
import 'package:busca_gifs/services/api.dart';
import 'package:flutter/material.dart';

class HomeEvents{
  List loadingStates = [ConnectionState.none, ConnectionState.waiting];
  List<Gifs> items;
  State<Home> state;
  String search;

  HomeEvents(this.state);

  void searchSubmit(String value) {
    if (value.isNotEmpty) {
      this.search = value;
      this.loadGifts();
    }
  }

  loadGifts({Function onDone}) async {
    await fetchGifs().then((values) {
      items = Gifs.fillCollection(values["data"]);
    });
  }

  bool isSearch(){
    if(this.search == null){
      return false;
    }
    return true;
  }

  Future<Map> fetchGifs() async{
    if(search == null){
      return await Api.trending().getData();
    }
    return await Api.search(search).getData();
  }
}