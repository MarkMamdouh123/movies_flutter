import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/DataBase/user.dart';

class userFire {
  static CollectionReference<User> getUserCollection() {
    var db = FirebaseFirestore.instance;
    var dbDoc = db.collection('user').withConverter<User>(
          fromFirestore: (snapshot, options) =>
              User.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
    return dbDoc;
  }

  static Future<User?> getuser() async {
    var doc1 = getUserCollection();
    var docSnapShot = await doc1.doc().get();
    return docSnapShot.data();
  }
}
