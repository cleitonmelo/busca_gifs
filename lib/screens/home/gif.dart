import 'package:busca_gifs/model/gif.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class GifPage extends StatelessWidget {
  final Gif item;

  GifPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Visualizar Gif",
            style: GoogleFonts.share(fontSize: 20.0),
            ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: (){
              Share.share(item.url);
            },
          )
        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: Container(
        child: Center(
          child: Image.network(item.url),
        ),
      )
    );
  }
}
