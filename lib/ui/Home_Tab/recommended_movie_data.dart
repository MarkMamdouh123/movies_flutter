import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/ApiManager/api_manager.dart';
import 'package:movies/BrowseResponse/MovieDetailsContent/movie_content_data.dart';
import 'package:movies/DataBase/movies_list.dart';
import 'package:movies/Provider/provider.dart';
import 'package:provider/provider.dart';

import '../MovieDetailsScreen/more_like_cards_list.dart';

class RecommendedMovieData extends StatefulWidget {
  MovieContentData? movie;
  int size = 0;

  RecommendedMovieData(this.movie, {super.key});

  @override
  State<RecommendedMovieData> createState() => _RecommendedMovieDataState();
}

class _RecommendedMovieDataState extends State<RecommendedMovieData> {
  MoviesList? movie1;

  @override
  void initState() {
    super.initState();
    if (widget.movie != null) {
      fetchMovie();
      widget.movie?.genres?.length != null
          ? widget.size = widget.movie!.genres!.length
          : 0;
    }
  }

  void fetchMovie() async {
    if (widget.movie != null && widget.movie!.id != null) {
      provider obj = Provider.of<provider>(context, listen: false);
      MoviesList fetchedMovie =
          await obj.getTask(MoviesList(widget.movie!.id.toString()));
      setState(() {
        movie1 = fetchedMovie;
      });
    }
  }

  void deleteFromFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.deleteTask(MoviesList(widget.movie?.id.toString()));
  }

  void addToFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.addTask(MoviesList(widget.movie?.id.toString(),
        is_added: true, name: widget.movie?.title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.movie?.title ?? "",
          style: TextStyle(color: Colors.white, fontFamily: "a", fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          InkWell(
            onTap: () {},
            child: Image.network(
              "https://image.tmdb.org/t/p/w500/${widget.movie?.backdropPath}",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.movie?.title ?? "",
            style:
                TextStyle(color: Colors.white, fontSize: 25, fontFamily: "a"),
          ),
          Text(
            widget.movie?.releaseDate ?? "",
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 11.0),
                        child: CachedNetworkImage(
                          height: 137,
                          width: 86,
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500/${widget.movie?.backdropPath}" ??
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
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error, color: Colors.grey),
                          ),
                        )),
                  ),
                  movie1 != null
                      ? movie1?.is_added == true
                          ? Padding(
                              padding: EdgeInsets.zero,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    deleteFromFireStore();
                                    fetchMovie();
                                    movie1 = null;
                                    movie1?.is_added = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.bookmark_added_rounded,
                                  color: Colors.amber,
                                  size: 24,
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.zero,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    addToFireStore();
                                    fetchMovie();
                                  });
                                },
                                icon: const Icon(
                                  Icons.bookmark_add_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            )
                      : Padding(
                          padding: EdgeInsets.zero,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                addToFireStore();
                                fetchMovie();
                              });
                            },
                            icon: const Icon(
                              Icons.bookmark_add_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        widget.movie?.genres?.length == 1
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 65,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Center(
                                      child: Text(
                                        widget.movie?.genres?[0].name ?? "",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              )
                            : Container(),
                        if (widget.size > 1)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    widget.movie?.genres?[1].name ?? "",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          )
                        else
                          Container(),
                        if (widget.size > 2)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    widget.movie?.genres?[2].name ?? "",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          )
                        else
                          Container(),
                      ],
                    ),
                    Text(
                      widget.movie?.overview ?? "",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, fontFamily: "a"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          widget.movie?.voteAverage.toString() ?? "",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
              color: Colors.grey[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      "More Like This",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                  FutureBuilder(
                    future:
                        apiManager.getMoreLikeThisList(widget.movie?.id ?? 0),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              Text(snapshot.error.toString()),
                              ElevatedButton(
                                  onPressed: () {}, child: Text('Try Again'))
                            ],
                          ),
                        );
                      }
                      var movie = snapshot.data?.results ?? [];
                      return moreLikeThisMovieCard(movie);
                    },
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
