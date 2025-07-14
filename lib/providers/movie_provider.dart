import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  // properties
  // final List<String> _moviesList = [
  //   "The Shawshank Redemption",
  //   "Avatar",
  //   "Titanic",
  //   "The Karate Kid",
  //   "Pulp Fiction",
  //   "The Wolf of the Wall Street",
  //   "Catch Me If You Can",
  //   "Shutter Island",
  //   "Interstellar",
  //   "The Dark Knight",
  //   "The Prestige",
  // ];

  late List<Movie> _moviesList;

  // getter
  List<Movie> get moviesList => _moviesList;

  // load movies
  Future<void> loadMovies(BuildContext context) async {
    try {
      final jsonString = await DefaultAssetBundle.of(
        context,
      ).loadString("assets/data/film.json");
      _moviesList = MovieParser.parse(jsonString);
      notifyListeners();
    } catch (e) {
      print("oops, some error in loading the data: $e");
    }
  }
}
