class User {
  String name;
  String imgUrl;
  bool isMe;
  User({
    this.name,
    this.imgUrl,
    this.isMe,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'].toString(),
      imgUrl: json['profileImageURL'].toString(),
    );
  }
}
