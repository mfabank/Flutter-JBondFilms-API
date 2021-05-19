import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapiodev/models/movies.dart';
import 'package:flutterapiodev/widgets/moviesWidget.dart';
import 'package:http/http.dart' as http;


void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Movie> _movies = new List<Movie>();

  Future<List<Movie>> _fetchAllMovies() async{
    final response = await http.get("http://www.omdbapi.com/?s=Bond&Page=2&apikey=d8015881");

    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((e) => Movie.fromJson(e)).toList();
    }
    else {
      throw Exception("Filmler Yüklenirken Hata!");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _populateAllMovies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("James Bold Films"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: MoviesWidget(movies : _movies),
    );
  }

  void _populateAllMovies() async{
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }
}
