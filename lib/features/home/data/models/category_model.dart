import 'package:ecommerce_app_huma_volve/features/home/domain/entity/category_entity.dart';

class CategoryModels extends CategoryEntity {
  
  CategoryModels(
      {
      super.id,
      super.name,
      super.slug,
      super.image,
      super.creationAt,
      super.updatedAt});

  CategoryModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
}