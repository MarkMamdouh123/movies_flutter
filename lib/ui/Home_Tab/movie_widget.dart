import 'package:flutter/material.dart';
import 'package:movies/model/newReleasesResponse/results.dart';

import 'display_movie_details.dart';

class MovieWidget extends StatefulWidget {
  List<Results>? newMovies;

  MovieWidget(this.newMovies);

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.newMovies?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Results? movie = widget.newMovies![index];
        return ReleaseMovieWidget(movie);
      },
    );
  }
}
