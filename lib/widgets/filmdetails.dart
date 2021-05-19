import 'package:flutter/material.dart';
import 'package:flutterapiodev/models/movies.dart';

class FilmDetails extends StatelessWidget {
  final Movie movies;
  FilmDetails({this.movies});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movies.title),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: Image.network(movies.poster),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: Text(movies.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: Text(movies.year,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
