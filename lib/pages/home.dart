import 'package:busca_gifs/events/home.dart';
import 'package:busca_gifs/services/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeEvents homeEvents;

  @override
  void initState(){
    super.initState();
    this.homeEvents = HomeEvents(this);

    Api.trending().getData().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
