import 'package:dartz/dartz.dart';

import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/details/data/datasource/abstract_data_source_details.dart';
import 'package:ecommerce_app_huma_volve/features/details/domians/repo/home_details_repo_abstract.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/product_entity.dart';

import '../../../../core/error/error_handling.dart';

class DetailsRepo implements HomeDetailsRepoAbstract {
  final AbstractDataSourceDetails abstractDataSourceDetails;

  DetailsRepo({required this.abstractDataSourceDetails});
  @override
  Future<Either<FailureApp, ProductEntity>> getProductById(
    int productId,
  ) async {
    try {
      final product = await abstractDataSourceDetails.getProductById(productId);
      return Right(product as ProductEntity);
    } catch (e) {
      return Left(
        ErrorHandler.getErrorMessage(
          e is Exception ? e : Exception(e.toString()),
        ),
      );
    }
  }
}
