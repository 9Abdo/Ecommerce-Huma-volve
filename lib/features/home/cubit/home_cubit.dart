import 'package:ecommerce_app_huma_volve/features/home/cubit/home_state.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/models/product_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/services/home_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeServices}) : super(InitHomeState());
  final HomeServices homeServices;
  Future getCategory() async {
    emit(LoadingCategoryState());
    try {
      List<CategoryModels> categoryModels = await homeServices.getCategory();
      emit(SuccessCategoryStae(categoryModels: categoryModels));
      List<ProductModel> productModel =   await homeServices.getProduct(categoryModels[0].id!);
      emit(SuccessProductState(productModel: productModel));
    } catch (e) {
      emit(FailureCategoryState(error: e.toString()));
    }
  }

  Future getProduct({required int productId}) async {
    emit(LoadingProductState());
    try {
      List<ProductModel> productModel = await homeServices.getProduct(
        productId,
      );
      emit(SuccessProductState(productModel: productModel));
    } catch (e) {
      emit(FailureProductState(error: e.toString()));
    }
  }
}
