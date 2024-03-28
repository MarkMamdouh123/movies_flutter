import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/more_like_responseList/more_like_result.dart';

class MoreLikeMovieWidget extends StatelessWidget {
  MoreLikeResult movie;
  MoreLikeMovieWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 11.0),
            child: CachedNetworkImage(
              height: 137,
              width: 86,
              imageUrl:
                  "https://image.tmdb.org/t/p/w500/${movie.backdropPath}" ?? '',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error, color: Colors.grey),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_add_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
