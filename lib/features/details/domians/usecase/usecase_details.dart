import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/details/domians/repo/home_details_repo_abstract.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/product_entity.dart';

class GetProductDetailsUseCase {
  final HomeDetailsRepoAbstract homeDetailsRepoAbstract;

 GetProductDetailsUseCase({required this.homeDetailsRepoAbstract});
  Future<Either<FailureApp, ProductEntity>> invoke(int productId) =>
      homeDetailsRepoAbstract.getProductById(productId);
}
