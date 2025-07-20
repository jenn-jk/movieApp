import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/movie_card.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Movie Details")), body: Container(
      child: Column(
        children: [
          MovieCard(movie: movie)
        ],
      ),
    ));
  }
}
