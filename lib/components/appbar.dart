import 'package:flutter/material.dart';

class HomeAppBar {
  static const BASE_URL = "https://developers.giphy.com";
  static const DIRECTORY ="branch/master/static";
  static const SRC_IMG = "header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif";

  String get _image {
    return "$BASE_URL/$DIRECTORY/$SRC_IMG";
  }

  Widget build() {
    return AppBar(
        backgroundColor: Colors.black,
        title: Image.network(_image),
        centerTitle: true,
      );
  }


}
