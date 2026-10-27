import 'package:ecommerce_app_huma_volve/features/details/domians/usecase/usecase_details.dart';
import 'package:ecommerce_app_huma_volve/features/details/presentation/cubit/home_datails_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailsCubit extends Cubit<HomeDatailsState> {
  HomeDetailsCubit({required this.getProductDetailsUseCase})
    : super(InitHomeDatailsState());
  final GetProductDetailsUseCase getProductDetailsUseCase;
  Future<void> getproductById(int productId) async {
    emit(LoadingHomeDatailsState());

    try {
      final result = await getProductDetailsUseCase.invoke(productId);

      result.fold(
        (failure) {
          emit(FailureHomeDatailsState(error: failure.failureMessage));
        },
        (product) {
          emit(SuccessHomeDatailsState(productEntity: product));
        },
      );
    } catch (e) {
      emit(FailureHomeDatailsState(error: e.toString()));
    }
  }
}
