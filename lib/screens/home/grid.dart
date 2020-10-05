import 'package:busca_gifs/events/home.dart';
import 'package:busca_gifs/model/gifs.dart';
import 'package:busca_gifs/screens/home/gif.dart';
import 'package:flutter/material.dart';

class HomeGrid{
  List<Gifs> items;
  int offset = 19;
  HomeEvents events;

  HomeGrid({this.items, this.events});

  Widget gridGifs(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemCount: events.isSearch() ? items.length + 1  : items.length,
        itemBuilder: (context, index) {
            if(events.isSearch() && index == items.length){
              return loadingGifs(this.events, items.length);
            }
            return GestureDetector(
              child: Image.network(
                  items[index].url,
                  height: 300.0,
                  fit: BoxFit.cover),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GifPage(items[index]),)
                );
              },
            );
        });
  }

  Widget loadingGifs(HomeEvents events, offset) {
    return Container(
      child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              children: [
                Icon(Icons.add, color: Colors.white, size: 50.0)
              ],
            ),
          ),
        onTap: (){
            events.onTapLoadingGifs(this.offset);
        },
      ),
    );
  }
}


