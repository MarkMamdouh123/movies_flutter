import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movies/DataBase/movies_list.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/SearchResponse/results.dart';
import 'package:movies/ui/SearchTab/dialog.dart';

import 'package:provider/provider.dart';

import '../Home_Tab/recommended_details_screen.dart';

class movieWidget extends StatefulWidget {
  Results movies;

  movieWidget(this.movies);

  @override
  State<movieWidget> createState() => _movieWidgetState();
}

class _movieWidgetState extends State<movieWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            setState(() {
              deleteFunc();
            });
          },
          backgroundColor: Colors.red,
          icon: Icons.delete,
          label: 'Delete',
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
          padding: const EdgeInsets.all(12),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, RecommendedMovieDetailScreen.routeName,
                    arguments: widget.movies.id);
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
                            "https://image.tmdb.org/t/p/w500/${widget.movies.backdropPath}" ??
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
                        errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error, color: Colors.grey)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            widget.movies.title?.substring(
                                    0, min(20, widget.movies.title!.length)) ??
                                '',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.movies.releaseDate?.length == 0
                                ? ''
                                : widget.movies.releaseDate?.substring(0, 4) ??
                                    '',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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
                color: const Color.fromRGBO(255, 255, 255, 0.67),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteFunc() async {
    Dialoge.showmsg(context, 'are you sure you want to delete?',
        pos: 'Yes', txt: 'Cancel', postAction: () {
      deletfromFireStore();
    });
  }

  void deletfromFireStore() async {
    Navigator.pop(context);
    provider obj = Provider.of<provider>(context, listen: false);
    print(widget.movies.releaseDate);
    await obj.deleteTask(MoviesList(widget.movies.id.toString()));
  }
}
