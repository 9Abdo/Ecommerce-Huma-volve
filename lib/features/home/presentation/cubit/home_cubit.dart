import 'package:ecommerce_app_huma_volve/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/usecase/get_category_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/usecase/get_product_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getCategoryUseCase, required this.getProductUseCase})
    : super(InitHomeState());
  final GetCategoryUseCase getCategoryUseCase;
  final GetProductUseCase getProductUseCase;
  final int limit = 10;
  int offset = 0;
  bool hasmore = true;
  bool loadingProduct = false;
  int? selectedCategory;
  final List<ProductEntity> productEntity = [];
  Future<void> getCategory() async {
    emit(LoadingCategoryState());

    final categoryModels = await getCategoryUseCase.invoke();
    categoryModels.fold(
      (failure) {
        emit(FailureCategoryState(error: failure.failureMessage));
      },
      (dateCategory) async {
        emit(SuccessCategoryStae(categoryModels: dateCategory));
        if (dateCategory.isEmpty) return;

        await getProduct(productId: dateCategory.first.id!);
      },
    );
  }

  Future<void> getProduct({required int productId}) async {
    hasmore = true;
    productEntity.clear();
    offset = 0;

    emit(LoadingProductState());

    final productModel = await getProductUseCase.invoke(
      productId,
      limit: limit,
      offset: offset,
    );
    productModel.fold(
      (failuer) {
        emit(FailureProductState(error: failuer.failureMessage));
      },
      (dataProduct) {
        productEntity.addAll(dataProduct);
        offset = dataProduct.length;
        if (dataProduct.length < limit) {
          hasmore = false;
        }
        selectedCategory = productId;
        emit(SuccessProductState(productModel: List.from(productEntity)));
      },
    );
  }

  Future<void> loadMoreProducts() async {
    if (loadingProduct || !hasmore || selectedCategory == null) {
      return;
    }

    loadingProduct = true;
    emit(LoadProductMoreState());

    try {
      final result = await getProductUseCase.invoke(
        selectedCategory!,
        limit: limit,
        offset: offset,
      );

      result.fold(
        (failure) {
          emit(LoadProductMoreError(error: failure.failureMessage));
        },
        (newProducts) {
          productEntity.addAll(newProducts);

          offset += newProducts.length;

          if (newProducts.length < limit) {
            hasmore = false;
          }

          emit(SuccessProductState(productModel: List.from(productEntity)));
        },
      );
    } finally {
      loadingProduct = false;
    }
  }
}
