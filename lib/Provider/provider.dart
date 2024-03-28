import 'package:flutter/material.dart';
import 'package:movies/DataBase/movie_fire.dart';
import 'package:movies/DataBase/movies_list.dart';
import 'package:movies/DataBase/user.dart' as userm;
import 'package:movies/DataBase/userFire.dart';

class provider extends ChangeNotifier {
  bool is_visible = true;
  userm.User? user;

  Future<void> login() async {
    user = await userFire.getuser();
  }

  Future<void> deleteTask(MoviesList? task) async {
    await MovieHandling.deleteTask(task);
    notifyListeners();
    return;
  }

  Future<void> addTask(MoviesList taskia) async {
    await MovieHandling.createTask(taskia);
    notifyListeners();
    return;
  }

  Future<MoviesList> getTask(MoviesList obj) async {
    var dbRef = await MovieHandling.gettaskcollection().doc(obj.id).get();

    return dbRef.data() ?? MoviesList('1');
  }
}
