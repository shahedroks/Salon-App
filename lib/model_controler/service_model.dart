class ServiceModel {
  String? id;
  final String? image;
  final String? name;
  ServiceModel({this.id, this.image, this.name});
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(image: json['image'] ?? "", name: json['name'] ?? "");
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    return data;
  }

  @override
  String toString() {
    return 'ServiceModel(id: $id, image: $image, name: $name)';
  }
}
