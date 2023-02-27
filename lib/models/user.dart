class UserModel {
  String? userId = '', name = '', email = '', imageUrl = '';

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    imageUrl = map['imageUrl'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
