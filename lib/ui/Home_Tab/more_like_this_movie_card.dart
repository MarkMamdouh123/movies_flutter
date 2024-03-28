import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/BrowseResponse/MoreLikeThis/more_like_this_results.dart';
import 'package:movies/ui/Home_Tab/recommended_details_screen.dart';

import 'more_like_this_movie_widget_list.dart';

class moreLikeThisMovieCard extends StatelessWidget {
  List<MoreLikeThisResults>? moreLikeThisMovies;

  moreLikeThisMovieCard(this.moreLikeThisMovies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: moreLikeThisMovies?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            MoreLikeThisResults movie = moreLikeThisMovies![index];
            return Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 11.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, RecommendedMovieDetailScreen.routeName,
                      arguments: movie.id);
                  // navigate to movie details screen
                },
                child: Card(
                  color: Color(0xff343534),
                  surfaceTintColor: Colors.transparent,
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 137,
                          child: MoreLikeThisMovieWidgetList(
                              recommendedMovie: movie),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.0),
                                child: Text(
                                  movie.voteAverage.toString() ?? "",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11.0),
                          child: Text(
                            movie.title.toString().substring(0,
                                    min(12, movie.title.toString().length)) ??
                                "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11.0),
                          child: Text(
                            movie.releaseDate.toString() ?? "",
                            style: TextStyle(
                              color: Color(0xffB5B4B4),
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
