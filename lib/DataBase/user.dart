class User {
  String? name;
  String? email;
  String? id;

  User(this.name, this.email, this.id);

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  User.fromFireStore(Map<String, dynamic>? mp) {
    id = mp?['id'];
    name = mp?['name'];
    email = mp?['email'];
  }
}
