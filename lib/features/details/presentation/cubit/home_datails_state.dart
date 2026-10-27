import 'package:ecommerce_app_huma_volve/features/home/domain/entity/product_entity.dart';

class HomeDatailsState {}

class InitHomeDatailsState extends HomeDatailsState {}

class LoadingHomeDatailsState extends HomeDatailsState {}

class SuccessHomeDatailsState extends HomeDatailsState {
  final ProductEntity productEntity;

  SuccessHomeDatailsState({required this.productEntity});
}

class FailureHomeDatailsState extends HomeDatailsState {
  final String error;

  FailureHomeDatailsState({required this.error});
}
