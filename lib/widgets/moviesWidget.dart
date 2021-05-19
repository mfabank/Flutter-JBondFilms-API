import 'package:flutter/material.dart';
import 'package:flutterapiodev/models/movies.dart';
import 'package:flutterapiodev/widgets/filmdetails.dart';

class MoviesWidget extends StatelessWidget {
  final List<Movie> movies;

  MoviesWidget({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context,index) {
        return movies.length == 0 ? CircularProgressIndicator() : Card(
          child: ListTile(
            leading: Image.network(movies[index].poster),
            title: Text(movies[index].title),
            subtitle: Text(movies[index].year),
            trailing: Icon(Icons.forward,color: Colors.deepPurpleAccent,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FilmDetails(movies: movies[index],)));
            },
          ),
        );
      },

    );
  }
}





