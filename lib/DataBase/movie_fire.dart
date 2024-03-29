import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/DataBase/movies_list.dart';
import 'package:movies/DataBase/userFire.dart';

class MovieHandling {
  static CollectionReference<MoviesList> getTaskcollection({String? id}) {
    var db;
    if (id == null) {
      db = userFire
          .getUserCollection()
          .doc("bf376d3cbdbf47c9a8c4bf1ef7d27f8a")
          .collection('movie')
          .withConverter(
              fromFirestore: (snapshot, options) =>
                  MoviesList.fromFireStore(snapshot.data()!),
              toFirestore: (value, options) => value.toFireStore());
    } else {
      db = userFire
          .getUserCollection()
          .doc("bf376d3cbdbf47c9a8c4bf1ef7d27f8a")
          .collection('movie')
          .doc(id)
          .withConverter(
              fromFirestore: (snapshot, options) =>
                  MoviesList.fromFireStore(snapshot.data()!),
              toFirestore: (value, options) => value.toFireStore());
    }

    return db;
  }

  static Future<void> createTask(
    MoviesList task,
  ) async {
    var dbRef = getTaskcollection().doc(task.id);
    await dbRef.set(task);
  }

  static Future<List<MoviesList>> getTasks() async {
    var dbRef = await getTaskcollection().get();
    var taskList = dbRef.docs.map((snapshot) => snapshot.data()).toList();

    return taskList;
  }

  static Future<void> deleteTask(MoviesList? task) async {
    var dbRef = await getTaskcollection().doc(task?.id);

    await dbRef.delete();
  }

  static Stream<List<MoviesList>> listForTasks() async* {
    var data = getTaskcollection().snapshots();
    yield* data.map((snapshot) =>
        snapshot.docs.map((snapshot) => snapshot.data()).toList());
  }
}
