import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/product_entity.dart';

abstract class HomeRepo {
  Future<Either<FailureApp, List<CategoryEntity>>> getCategory();
  Future<Either<FailureApp, List<ProductEntity>>> getProduct(
    int productId, {
    required int limit,
    required int offset,
  });
}
