class UsersModel {
  final String? id;
  final String? name;
  final String? username;
  final String? email;
  final String? number;
  final String? image;
  final String? token;
  final String? address;
  final String? cover_image;
  final String? bio;
  final String? gender;

  UsersModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.number,
    this.image,
    this.token,
    this.address,
    this.cover_image,
    this.bio,
    this.gender,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      number: json['number'] ?? "",
      image: json['image'] ?? "",
      token: json['token'] ?? "",
      address: json['address'] ?? "",
      cover_image: json['cover_image'] ?? "",
      bio: json['bio'] ?? "",
      gender: json['gender'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['number'] = number;
    data['image'] = image;
    data['token'] = token;
    data['address'] = address;
    data['cover_image'] = cover_image;
    data['bio'] = bio;
    data['gender'] = gender;
    return data;
  }

  @override
  String toString() {
    return 'UsersModel(id: $id, name: $name, users:$username, email: $email, number: $number,gander:$gender, image: $image,address: $address,cover_imgae:$cover_image,bio:$bio, token: $token)';
  }
}
