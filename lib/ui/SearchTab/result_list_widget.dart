import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/SearchTab/search_model.dart';

import 'movie_widget.dart';

class resultListWidget extends StatefulWidget {
  String search;
  String? id;

  resultListWidget(this.search, {super.key, this.id});

  @override
  State<resultListWidget> createState() => _resultListWidgetState();
}

class _resultListWidgetState extends State<resultListWidget> {
  var model = SearchViewModel();

  @override
  Widget build(BuildContext context) {
    widget.id == null
        ? model.getMovieData(widget.search, id: '')
        : model.getMovieData(widget.search, id: widget.id);
    return BlocBuilder<SearchViewModel, MovieSearchState>(
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              // implicit casting
              return const Center();
            }
          case ErrorState():
            {
              return Center(
                child: ElevatedButton(
                  child: Text(
                    state.errorMessage ?? 'Error',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    model.getMovieData(widget.search);
                  },
                ),
              );
            }
          case SuccessState():
            {
              if (state.results.length == 1) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: movieWidget(state.results[0]),
                );
              }

              return SizedBox(
                // Add a Container to specify the size of the ListView
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: movieWidget(state.results[index]),
                    );
                  },
                ),
              );
            }
        }
      },
      bloc: model,
    );
  }
}
