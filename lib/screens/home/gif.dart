import 'package:busca_gifs/model/gifs.dart';
import 'package:flutter/material.dart';

class GifPage extends StatelessWidget {
  final Gifs item;

  GifPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualizar Gif"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white,)
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Image.network(item.url),
        ),
      )
    );
  }
}
