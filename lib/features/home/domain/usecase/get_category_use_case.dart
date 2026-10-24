import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repo/home_repo.dart';

class GetCategoryUseCase {
  final HomeRepo homeRepo;

  GetCategoryUseCase({required this.homeRepo});
  Future<Either<FailureApp, List<CategoryEntity>>> invoke() =>
      homeRepo.getCategory();
}
