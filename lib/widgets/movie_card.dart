import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, this.isDetailsRequired = true});

  final Movie movie;
  final bool isDetailsRequired;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text("Director: ${movie.director}"),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(movie.images[0]),
          // child: Text(movie.title[0])
        ),
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 50),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "Released: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: movie.released),
                      TextSpan(
                        text: "\nPlot: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: movie.plot),
                    ],
                  ),
                ),
                !isDetailsRequired ? const Text("") : TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetails(movie: movie),
                      ),
                    ),
                  },
                  child: Text("Read More"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
