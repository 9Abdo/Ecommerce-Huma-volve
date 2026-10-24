import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repo/home_repo.dart';

import '../entity/product_entity.dart';

class GetProductUseCase {
  final HomeRepo homeRepo;

  GetProductUseCase({required this.homeRepo});
  Future<Either<FailureApp, List<ProductEntity>>> invoke(int productId) =>
      homeRepo.getProduct(productId);
}
