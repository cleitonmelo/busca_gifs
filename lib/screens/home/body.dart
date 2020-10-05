import 'package:busca_gifs/components/loading.dart';
import 'package:busca_gifs/events/home.dart';
import 'package:busca_gifs/model/gifs.dart';
import 'package:busca_gifs/screens/home/grid.dart';
import 'package:flutter/material.dart';

class HomeBody {
  List loadingStates = [ConnectionState.none, ConnectionState.waiting];
  List<Gifs> items;
  HomeEvents events;

  HomeBody({this.events});

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
      onSubmitted: (text){
        events.state.setState(() {
          events.searchSubmit(text);
        });
      },
    );
  }

  FutureBuilder loadingGifs() {
    return FutureBuilder(
      future: events.fetchGifs(),
      builder: (context, snapshot) {
        if (loadingStates.contains(snapshot.connectionState)) {
          return Loading().circularWaiting();
        }
        if (snapshot.hasError) {
          return Loading().iconError();
        }
        items = Gifs.fillCollection(snapshot.data["data"]);
        return HomeGrid(items: items, events: events).gridGifs(context);
      },
    );
  }
}