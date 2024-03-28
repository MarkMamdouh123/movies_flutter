import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/MoviesResponse/results.dart';

import '../Home_Tab/recommended_details_screen.dart';

class MovieWidget extends StatelessWidget {
  Results? results;

  MovieWidget(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RecommendedMovieDetailScreen.routeName,
                arguments: results!.id);
          },
          child: Row(
            children: [
              Container(
                color: Colors.white,
                child: Center(
                  child: CachedNetworkImage(
                    height: 89,
                    width: 140,
                    imageUrl:
                        "https://image.tmdb.org/t/p/original/${results?.backdropPath}" ??
                            '',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Center(
                        child: const Icon(Icons.error, color: Colors.grey)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      results?.title
                              ?.substring(0, min(20, results!.title!.length)) ??
                          '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      results?.releaseDate?.length == 0
                          ? ''
                          : results?.releaseDate?.substring(0, 4) ?? '',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.67),
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14, left: 10.0, right: 10.0),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Color.fromRGBO(255, 255, 255, 0.67),
          ),
        ),
      ],
    );
  }
}
