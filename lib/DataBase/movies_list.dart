
class MoviesList {

  String? id;
  String ?name;
  bool ?is_added=false;

  MoviesList(this.id,{this.name,this.is_added});

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'name':name,
      'is_added': is_added
   };
  }

  MoviesList.fromFireStore(Map<String, dynamic>? mp)
      : this(mp?['id'],name:mp?['name']
      ,is_added:mp?['is_added']);
}
