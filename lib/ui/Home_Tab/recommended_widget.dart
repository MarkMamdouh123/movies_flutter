import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/DataBase/movies_list.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/model/recommendedResponse/recommended_result.dart';
import 'package:provider/provider.dart';

class RecommendedMovieWidget extends StatefulWidget {
  static const routeName = '/RecommendedMovieWidget';
  Results? recommendedMovie;

  RecommendedMovieWidget({Key? key, this.recommendedMovie}) : super(key: key);

  @override
  State<RecommendedMovieWidget> createState() => _RecommendedMovieWidgetState();
}

class _RecommendedMovieWidgetState extends State<RecommendedMovieWidget> {
  MoviesList? movie;

  @override
  void initState() {
    super.initState();
    if (widget.recommendedMovie != null) fetchMovie();
  }

  void fetchMovie() async {
    provider obj = Provider.of<provider>(context, listen: false);
    MoviesList fetchedMovie =
        await obj.getTask(MoviesList(widget.recommendedMovie?.id.toString()));
    setState(() {
      movie = fetchedMovie;
    });
  }

  void deleteFromFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.deleteTask(MoviesList(widget.recommendedMovie?.id.toString()));
  }

  void addToFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.addTask(MoviesList(widget.recommendedMovie?.id.toString(),
        is_added: true, name: widget.recommendedMovie?.name));
  }

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
                  "https://image.tmdb.org/t/p/w500/${widget.recommendedMovie?.backdropPath}" ??
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
            ),
          ),
        ),
        movie != null
            ? movie?.is_added == true
                ? Padding(
                    padding: EdgeInsets.zero,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          deleteFromFireStore();
                          fetchMovie();
                          movie = null;
                          movie?.is_added = false;
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
    );
  }
}
