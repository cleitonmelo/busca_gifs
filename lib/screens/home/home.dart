import 'package:busca_gifs/components/appbar.dart';
import 'package:busca_gifs/events/home.dart';
import 'package:busca_gifs/screens/home/body.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar().build(),
      body: HomeBody(gifs: homeEvents.fetchGifs()).build(),
      backgroundColor: Colors.black,
      );
  }
}
