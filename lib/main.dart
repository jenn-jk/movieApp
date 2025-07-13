import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie App")),
      body: Center(
        child: ListView.builder(
          itemCount: _moviesList.length,
          itemBuilder: (context, index) {
            return(Text(_moviesList[index]));
          },
        ),
      ),
    );
  }
}
