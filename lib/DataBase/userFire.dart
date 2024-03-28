import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/DataBase/user.dart';

class userFire {
  static CollectionReference<User> getusercollection() {
    var db = FirebaseFirestore.instance;
    var dbDoc = db.collection('user').withConverter<User>(
          fromFirestore: (snapshot, options) =>
              User.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
    return dbDoc;
  }

  static Future<User?> getuser() async {
    var doc1 = getusercollection();
    var docSnapShot = await doc1.doc("bf376d3cbdbf47c9a8c4bf1ef7d27f8a").get();
    return docSnapShot.data();
  }
}
