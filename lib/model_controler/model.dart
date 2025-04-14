class UsersModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;

  UsersModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
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
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['token'] = token;
    return data;
  }

  @override
  String toString() {
    return 'UsersModel(id: $id, name: $name, email: $email, phone: $phone, image: $image, token: $token)';
  }
}
