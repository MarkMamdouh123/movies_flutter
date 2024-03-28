import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/popularResponse/results.dart';
import 'package:movies/ui/Home_Tab/recommended_details_screen.dart';

class popularWidget extends StatelessWidget {
  final Results movies;

  popularWidget(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RecommendedMovieDetailScreen.routeName,
            arguments: movies.id);
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/original/${movies.backdropPath}" ??
                                  ''),
                    ),
                    Column(
                      children: [
                        Text(
                          movies.title?.substring(
                                  0, min(20, movies.title!.length)) ??
                              '',
                          style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontFamily: "second"),
                        ),
                        Text(
                          movies.releaseDate ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xffB5B4B4),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
