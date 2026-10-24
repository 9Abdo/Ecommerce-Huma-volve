import 'package:ecommerce_app_huma_volve/features/home/domain/usecase/get_category_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/usecase/get_product_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getCategoryUseCase, required this.getProductUseCase})
    : super(InitHomeState());
  final GetCategoryUseCase getCategoryUseCase;
  final GetProductUseCase getProductUseCase;
  Future getCategory() async {
    emit(LoadingCategoryState());

    final categoryModels = await getCategoryUseCase.invoke();
    categoryModels.fold(
      (failure) {
        emit(FailureCategoryState(error: failure.failureMessage));
      },
      (dateCategory) async {
        emit(SuccessCategoryStae(categoryModels: dateCategory));
        final productModel = await getProductUseCase.invoke(
          dateCategory[0].id!,
        );
        productModel.fold(
          (failure) {
            emit(FailureProductState(error: failure.failureMessage));
          },
          (dataproduct) {
            emit(SuccessProductState(productModel: dataproduct));
          },
        );
      },
    );
  }

  Future getProduct({required int productId}) async {
    emit(LoadingProductState());

    final productModel = await getProductUseCase.invoke(productId);
    productModel.fold(
      (failuer) {
        emit(FailureProductState(error: failuer.failureMessage));
      },
      (dataProduct) {
        emit(SuccessProductState(productModel: dataProduct));
      },
    );
  }
}
