import 'package:ecommerce_app_huma_volve/features/home/domain/entity/category_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/product_entity.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class LoadingCategoryState extends HomeState {}

class SuccessCategoryStae extends HomeState {
  final List<CategoryEntity> categoryModels;
  SuccessCategoryStae({required this.categoryModels});
}

class FailureCategoryState extends HomeState {
  final String error;
  FailureCategoryState({required this.error});
}

class LoadingProductState extends HomeState {}

class SuccessProductState extends HomeState {
  final List<ProductEntity> productModel;
  SuccessProductState({required this.productModel});
}

class FailureProductState extends HomeState {
  final String error;
  FailureProductState({required this.error});
}

class LoadProductMoreState extends HomeState {}

class LoadProductMoreError extends HomeState {
  final String error;

  LoadProductMoreError({required this.error});
}
