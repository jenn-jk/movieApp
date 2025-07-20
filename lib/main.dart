import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_details.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MovieProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieModel = Provider.of<MovieProvider>(context);
    final movies = movieModel.moviesList;

    return Scaffold(
      appBar: AppBar(title: Text("Movie App")),
      body: Center(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            Movie movie = movies[index];
            return Card(
              child: ExpansionTile(
                title: Text(movie.title),
                subtitle: Text("Director: ${movie.director}"),
                leading: CircleAvatar(child: Text(movie.title[0])),
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
                                style: Theme.of(context).textTheme.labelLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: movie.released),
                              TextSpan(
                                text: "\nPlot: ",
                                style: Theme.of(context).textTheme.labelLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: movie.plot),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetails(movie: movie),
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
          },
        ),
      ),
    );
  }
}
