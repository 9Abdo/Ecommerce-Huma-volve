import 'package:ecommerce_app_huma_volve/features/home/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/product_model.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class LoadingCategoryState extends HomeState {}

class SuccessCategoryStae extends HomeState {
  List<CategoryModels> categoryModels;
  SuccessCategoryStae({required this.categoryModels});
}

class FailureCategoryState extends HomeState {
  final String error;
  FailureCategoryState({required this.error});
}

class LoadingProductState extends HomeState {}

class SuccessProductState extends HomeState {
  final List<ProductModel> productModel;
  SuccessProductState({required this.productModel});
}

class FailureProductState extends HomeState {
  final String error;
  FailureProductState({required this.error});
}
