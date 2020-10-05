import 'package:busca_gifs/events/home.dart';
import 'package:busca_gifs/model/gifs.dart';
import 'package:busca_gifs/screens/home/gif.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

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
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: items[index].url,
                  fit: BoxFit.cover,
                  height: 300.0
              ),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GifPage(items[index]),)
                );
              },
              onLongPress: (){
                Share.share(items[index].url);
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


