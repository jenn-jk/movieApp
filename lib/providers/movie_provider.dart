import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier{
  // properties
  final List<String> _moviesList = [
    "The Shawshank Redemption",
    "Avatar",
    "Titanic",
    "The Karate Kid",
    "Pulp Fiction",
    "The Wolf of the Wall Street",
    "Catch Me If You Can",
    "Shutter Island",
    "Interstellar",
    "The Dark Knight",
    "The Prestige",
  ];

  // getter
  List<String> get moviesList => _moviesList;

  // load movies
  List<String> loadMovies() {
    return _moviesList;
  }
}