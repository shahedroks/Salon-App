class UsersModel {
  final String? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;

  UsersModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.token,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      image: json['image'] ?? "",
      token: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['token'] = token;
    return data;
  }

  @override
  String toString() {
    return 'UsersModel(id: $id, name: $name, users:$username, email: $email, phone: $phone, image: $image, token: $token)';
  }
}
