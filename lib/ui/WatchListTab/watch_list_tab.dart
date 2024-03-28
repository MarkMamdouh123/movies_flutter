import 'package:flutter/material.dart';

import 'package:movies/home_screen.dart';

import '../../DataBase/movie_fire.dart';
import '../SearchTab/result_list_widget.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: StreamBuilder(
          stream: MovieHandling.listForTasks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Expanded(
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      snapshot.error?.toString() ?? "",
                    ),
                  ),
                ),
              );
            } else {
              var taskList = snapshot.data;
              if (taskList == null || taskList.isEmpty) {
                return const Center(
                  child: Text(
                    'No movies found',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return resultListWidget(taskList[index].name,
                          id: taskList[index].id);
                    },
                    itemCount: taskList.length,
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
