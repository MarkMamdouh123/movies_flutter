// import 'package:flutter/material.dart';
// import 'package:movies/ApiManager/api_manager.dart';
// import 'package:movies/model/more_like_responseList/more_like_list_response.dart';
// import 'package:movies/model/movie_details_response/movie_details_response.dart';
// import 'package:movies/model/recommendedResponse/recommended_result.dart';
// import 'package:movies/ui/Home_Tab/movie_card.dart';
// import 'package:movies/ui/MovieDetailsScreen/content_screen.dart';
// import 'package:movies/ui/MovieDetailsScreen/more_like_cards_list.dart';
//
// class MoreLikeListWidget extends StatelessWidget {
//
//   MovieDetailsResponse movie;
//   MoreLikeListWidget(this.movie);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: apiManager.getMoreLike(movie.id),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasData) {
//           return Center(
//             child: Column(
//               children: [
//                 Text(
//                      snapshot.error.toString()),
//                 ElevatedButton(onPressed: () {
//                   print("Erroooooooor :${snapshot.error.toString()}");
//                 }, child: Text('Try Again'))
//               ],
//             ),
//           );
//         }
//         RecommendedResult? moreLikeMoviesList = snapshot.data;
//         return ContentScreen(movie: movie,moreLikeList: moreLikeMoviesList?.results);
//
//
//
//       }
//     );
//   }
// }
