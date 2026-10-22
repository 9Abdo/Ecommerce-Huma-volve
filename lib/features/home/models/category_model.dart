class CategoryModels {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryModels(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.creationAt,
      this.updatedAt});

  CategoryModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
}