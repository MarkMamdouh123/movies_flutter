import 'package:flutter/material.dart';
import 'package:movies/ApiManager/api_manager.dart';

import 'movie_widget.dart';

class NewListWidget extends StatefulWidget {
  const NewListWidget({super.key});

  @override
  State<NewListWidget> createState() => _NewListWidgetState();
}

class _NewListWidgetState extends State<NewListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getNewReleases(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }

        var newReleasesList = snapshot.data?.results;
        return MovieWidget(newReleasesList);
      },
    );
  }
}
