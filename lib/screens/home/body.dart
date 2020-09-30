import 'package:busca_gifs/components/loading.dart';
import 'package:busca_gifs/screens/home/grid.dart';
import 'package:flutter/material.dart';

class HomeBody {
  Future<Map> gifs;
  List loadingStates = [ConnectionState.none, ConnectionState.waiting];
  HomeBody({this.gifs});

  Widget build() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: searchText()
        ),
        Expanded(
          child: loadingGifs(),
        )
      ],
    );
  }

  Widget searchText({TextEditingController controller}){
    return TextField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: "Pesquise aqui",
          border: OutlineInputBorder()
      ),
      style: TextStyle(
          color: Colors.white, fontSize: 18.0
      ),
      textAlign: TextAlign.center,
      controller: controller,
    );
  }

  FutureBuilder loadingGifs(){
    return FutureBuilder(
        future: this.gifs,
        builder: (context, snapshot) {
          if(loadingStates.contains(snapshot.connectionState)){
            return Loading().circularWaiting();
          }
          if(snapshot.hasError){
             return Loading().iconError();
          }
          return gridGifs(context, snapshot);
        },
    );
  }



}