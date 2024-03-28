import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/recommendedResponse/recommended_result.dart';
import '../../model/movie_details_response/movie_details_response.dart';
import '../Home_Tab/movie_card.dart';

class ContentScreen extends StatefulWidget {
  static const String routeName = "ContentScreen";
  MovieDetailsResponse? movie;
  List<Results>? moreLikeList;

  ContentScreen({this.movie, this.moreLikeList}) {}

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  // movieID = 507089
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie?.title ?? ""),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500${widget.movie?.posterPath ?? ""}" ??
                            "",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.do_not_disturb),
                  ),
                ),
                Icon(
                  Icons.play_circle,
                  size: 60,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
              color: Colors.red,
              margin: EdgeInsets.only(top: 20, left: 22),
              child: Text(
                widget.movie?.title ?? "",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Container(
              height: 20,
              margin: EdgeInsets.only(left: 22),
              child: Text(
                "${widget.movie?.releaseDate ?? ""}   ${(widget.movie?.runtime)} min",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              )),
          SizedBox(
            height: 18,
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500${widget.movie?.posterPath ?? ""}" ??
                                        "",
                                height: 200,
                                width: 130,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress)),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.do_not_disturb),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_add_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            "${widget.movie?.status ?? ""}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            widget.movie?.adult ?? "" == true
                                ? "Adults Only"
                                : "All Ages",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 230,
                      height: 100,
                      child: Text(
                        '''${widget.movie?.overview ?? ""}''',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "${widget.movie?.voteAverage ?? ""}" ?? "",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey,
            child: MovieCard(widget.moreLikeList),
          )
        ],
      ),
    );
  }
}
