import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ApiManager/api_manager.dart';

import 'package:movies/DataBase/movies_list.dart';
import 'package:movies/SearchResponse/results.dart';

import '../../DataBase/movie_fire.dart';

class SearchViewModel extends Cubit<MovieSearchState> {
  SearchViewModel() : super(LoadingState());

  void getMovieData(String search, {String? id}) async {
    emit(LoadingState());
    try {
      var response = id == ''
          ? await apiManager.get(search)
          : await apiManager.get(search, id: id);
      var answer = response.results!
          .where((element) => element.id.toString().contains(id!))
          .toList();
      if (answer.isEmpty) {
        MovieHandling.deleteTask(MoviesList(id.toString()));
      }

      emit(SuccessState(answer ?? []));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class MovieSearchState {}

class LoadingState extends MovieSearchState {}

class ErrorState extends MovieSearchState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState extends MovieSearchState {
  List<Results> results;

  SuccessState(this.results);
}
