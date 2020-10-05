import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar {
  Widget build() {
    return AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        // title: Image.network(_image),
        title: Text(
              "Buscador de Gifs",
            style: GoogleFonts.share(fontSize: 25.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none)),
        centerTitle: true,
        );
  }


}
