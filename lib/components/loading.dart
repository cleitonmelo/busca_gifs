import 'package:flutter/material.dart';

class Loading{
  Widget iconWaiting(){
    return Center(
      child: Icon(Icons.autorenew, color: Colors.white, size: 100.0),
    );
  }

  Widget textWaiting(String text){
    return Center(
      child: Text(text),
    );
  }

  Widget circularWaiting(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget iconError(){
    return Center(
      child: Icon(Icons.error, color: Colors.white, size: 100.0),
    );
  }


}