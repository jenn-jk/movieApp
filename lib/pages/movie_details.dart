import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/movie_card.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Details")),
      body: Container(
        child: Column(
          children: [
            MovieCard(movie: movie),
            Text(
              "Movie Posters",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: movie.images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Image(
                    image: NetworkImage(movie.images[index]),
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
