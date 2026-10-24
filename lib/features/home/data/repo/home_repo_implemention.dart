import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handling.dart';

import '../datasource/remote_home_date_source.dart';
import '../../domain/entity/category_entity.dart';
import "../../domain/entity/product_entity.dart";
import '../../domain/repo/home_repo.dart';

import '../../../../core/failure/failure.dart';

class HomeRepoImplemention implements HomeRepo {
  final RemoteHomeDateSource remoteHomeDateSource;

  HomeRepoImplemention({required this.remoteHomeDateSource});
  @override
  Future<Either<FailureApp, List<CategoryEntity>>> getCategory() async {
    try {
      final categories = await remoteHomeDateSource.getCategory();
      return Right(categories as List<CategoryEntity>);
    } catch (e) {
      return Left(
        ErrorHandler.getErrorMessage(
          e is Exception ? e : Exception(e.toString()),
        ),
      );
    }
  }
  @override
  Future<Either<FailureApp, List<ProductEntity>>> getProduct(
    int productId,
  ) async {
    try {
      final products = await remoteHomeDateSource.getProduct(productId);
      return Right(products as List<ProductEntity>);
    } catch (e) {
      return Left(
        ErrorHandler.getErrorMessage(
          e is Exception ? e : Exception(e.toString()),
        ),
      );
    }
  }
}
