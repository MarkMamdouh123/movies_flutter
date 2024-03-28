import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/BrowseResponse/category_response.dart';
import 'package:movies/BrowseResponse/MoreLikeThis/more_like_this_list.dart';
import 'package:movies/BrowseResponse/MovieDetailsContent/movie_content_data.dart';
import 'package:movies/MoviesResponse/movie_category.dart';
import 'package:movies/SearchResponse/search_response.dart';
import 'package:movies/model/newReleasesResponse/new_releases_response.dart';
import 'package:movies/model/recommendedResponse/recommended_result.dart';
import 'package:movies/popularResponse/popular_response.dart';

class apiManager {
  static const baseUrl = 'api.themoviedb.org';

  static Future<SearchResponse> get(String search, {String? id}) async {
    var url = Uri.https('api.themoviedb.org', '/3/search/movie', {
      'api_key': 'a3542830bd3dbcb32a095c3515502788',
      'query': search,
      'include_adult': 'false',
      'language': 'en-US',
      'page': '1',
      'id': id,
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var searchResponse = SearchResponse.fromJson(json);
    return searchResponse;
  }

  static Future<NewReleasesResponse> getNewReleases() async {
    var url = Uri.https(baseUrl, '/3/movie/upcoming', {
      'api_key': 'a3542830bd3dbcb32a095c3515502788',
      'language': 'en-US',
      'page': '1',
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newReleasesResponse = NewReleasesResponse.fromJson(json);
    return newReleasesResponse;
  }

  static Future<RecommendedResult> getRecommended() async {
    var apiKey = 'a3542830bd3dbcb32a095c3515502788';
    var baseUrl = 'api.themoviedb.org';
    var url = Uri.https(baseUrl, '/3/tv/top_rated', {'api_key': apiKey});

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    RecommendedResult recommendedResponse = RecommendedResult.fromJson(json);
    return recommendedResponse;
  }

  static Future<CategoryResponse> getCategory() async {
    var url = Uri.https('api.themoviedb.org', '/3/genre/movie/list',
        {'api_key': 'a3542830bd3dbcb32a095c3515502788'});

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var categoryResponse = CategoryResponse.fromJson(json);
    return categoryResponse;
  }

  static Future<MovieCategory> getMovies(String genres) async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie',
        {'api_key': 'a3542830bd3dbcb32a095c3515502788', 'with_genres': genres});

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var movieCategory = MovieCategory.fromJson(json);
    return movieCategory;
  }

  static Future<PopularResponse> getPopular() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      'api_key': 'a3542830bd3dbcb32a095c3515502788',
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var popularResponse = PopularResponse.fromJson(json);
    return popularResponse;
  }

  static Future<MovieContentData> getContent(int id) async {
    var url =
        Uri.parse('https://api.themoviedb.org/3/movie/$id?language=en-US');
    var response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMzU0MjgzMGJkM2RiY2IzMmEwOTVjMzUxNTUwMjc4OCIsInN1YiI6IjY2MDAzYTQ4MzUyMGU4MDE3ZWQ4OWM1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Q_itBNG-27ubTvXQ0c4IaSmKVVTYwl3DtMb3LXYwyh4',
        'Accept': 'application/json',
      },
    );
    var json = jsonDecode(response.body);
    var contentData = MovieContentData.fromJson(json);

    return contentData;
  }

  static Future<MoreLikeThisList> getMoreLikeThisList(int id) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/similar?language=en-US&page=1');
    var response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YmI0OWNlMGE4NmIyNTBkY2YwZjYzMTUwMWEwNmRjNSIsInN1YiI6IjY1M2Y3NTFjYmMyY2IzMDBhY2E0OTE0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ITwh7NU1_GurrLQJiNqo6Bc7gZOIPhhmkQM_NZopNmQ',
        'Accept': 'application/json',
      },
    );
    var json = jsonDecode(response.body);
    var contentData = MoreLikeThisList.fromJson(json);
    print(contentData.results);

    return contentData;
  }
}
