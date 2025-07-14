import 'dart:convert';
import 'package:movie_app/models/movie.dart';

class MovieParser {
  static List<Movie> parse(String jsonString) {
    List<dynamic> parsedJsonList = json.decode(jsonString);
    List<Movie> parsedMovieList = parsedJsonList.map((jsonItem) => Movie.fromJson(jsonItem)).toList();
    return parsedMovieList;
  }
}
