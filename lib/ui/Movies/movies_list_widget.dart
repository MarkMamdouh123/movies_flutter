import 'package:flutter/material.dart';

import 'package:movies/ApiManager/api_manager.dart';

import 'movies_widget.dart';

class MoviesListWidget extends StatelessWidget {
  static const String routeName = 'MoviesList';
  int? genres;

  MoviesListWidget({this.genres});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MoviesListWidget;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
            height: 50,
            width: 200,
            child: Image.asset("assets/splash_screen.png")),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: apiManager.getMovies(args.genres.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                    onPressed: () {
                      apiManager.getMovies(args.genres.toString());
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          var MoviesList = snapshot.data?.results;
          print(MoviesList?.length);
          return ListView.builder(
            itemBuilder: (context, index) {
              return MovieWidget(MoviesList?[index]);
            },
            itemCount: MoviesList?.length,
          );
        },
      ),
    );
  }
}
