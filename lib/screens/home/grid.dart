import 'package:busca_gifs/model/gifs.dart';
import 'package:flutter/material.dart';

class HomeGrid{
  List<Gifs> items;
  bool onSearch;

  HomeGrid({this.items, this.onSearch});

  Widget gridGifs(BuildContext context) {
    print(this.onSearch);
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemCount: onSearch ? items.length+1  : items.length,
        itemBuilder: (context, index) {
          if(onSearch || index < items.length){
            return GestureDetector(
              child: Image.network(
                  items[index].url,
                  height: 300.0,
                  fit: BoxFit.cover),
            );
          }
          return Container(
            child: GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 50.0),
                    Text("Carregar mais ...", style: TextStyle(color: Colors.white, fontSize: 20.0))
                  ],
                ),
              )

            ),
          );
        });
  }

}


