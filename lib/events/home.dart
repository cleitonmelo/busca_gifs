import 'package:busca_gifs/model/gif.dart';
import 'package:busca_gifs/screens/home/home.dart';
import 'package:busca_gifs/services/api.dart';
import 'package:flutter/material.dart';

class HomeEvents{
  List loadingStates = [ConnectionState.none, ConnectionState.waiting];
  List<Gif> items;
  State<Home> state;
  String search;
  int offset = 0;

  HomeEvents(this.state);

  void searchSubmit(String value) {
    if (value.isNotEmpty) {
      this.search = value;
      this.loadGifts();
    }
  }

  void onTapLoadingGifs(value) async{
    this.offset += Api.DEFAULT_LIMIT;
    state.setState(() {
      this.loadGifts();
    });
  }

  loadGifts({Function onDone}) async {
    await fetchGifs().then((values) {
      items = Gif.fillCollection(values["data"]);
    });
  }

  bool isSearch(){
    if(this.search == null || this.search.isEmpty){
      return false;
    }
    return true;
  }

  Future<Map> fetchGifs() async{
    if(search == null){
      return await Api.trending(offset: this.offset).getData();
    }
    return await Api.search(search, offset: this.offset).getData();
  }
}