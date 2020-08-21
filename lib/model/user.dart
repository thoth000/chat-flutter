class User {
  String id;
  String name;
  String imgUrl;
  bool isMe;
  User({
    this.id,
    this.name,
    this.imgUrl,
    this.isMe,
  });

  factory User.fromJson(Map<String, dynamic> json, String userId) {
    return User(
      id: userId,
      name: json['name'].toString(),
      imgUrl: json['profileImageURL'].toString(),
    );
  }
}
