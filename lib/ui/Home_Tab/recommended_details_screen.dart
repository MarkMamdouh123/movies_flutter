import 'package:flutter/material.dart';
import 'package:movies/ApiManager/api_manager.dart';
import 'package:movies/BrowseResponse/MovieDetailsContent/movie_content_data.dart';
import 'package:movies/ui/Home_Tab/recommended_movie_data.dart';

class RecommendedMovieDetailScreen extends StatefulWidget {
  static const String routeName = '/RecommendedMovieDetailScreen';
  int? id;

  RecommendedMovieDetailScreen({this.id});

  @override
  State<RecommendedMovieDetailScreen> createState() =>
      _RecommendedMovieDetailScreenState();
}

class _RecommendedMovieDetailScreenState
    extends State<RecommendedMovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as int;
    widget.id = args;
    return FutureBuilder(
      future: apiManager.getContent(widget.id ?? 0),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error?.toString() ?? "Error loading data"),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        MovieContentData? movie = snapshot.data;

        return RecommendedMovieData(movie);
      },
    );
  }
}
