import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../repo/home_repo.dart';

import '../entity/product_entity.dart';

class GetProductUseCase {
  final HomeRepo homeRepo;

  GetProductUseCase({required this.homeRepo});
  Future<Either<FailureApp, List<ProductEntity>>> invoke(
    int productId, {
    required int limit,
    required int offset,
  }) => homeRepo.getProduct(productId, limit: limit, offset: offset);
}
