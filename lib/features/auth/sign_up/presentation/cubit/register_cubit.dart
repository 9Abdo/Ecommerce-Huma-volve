
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/register_request.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domains/usecase/register_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/presentation/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitState());
  final RegisterUseCase registerUseCase;
  Future rgister(RegisterRequest registerRequest) async {
    emit(LoadingRegisterState());
    final response = await registerUseCase.invoke(registerRequest);
    response.fold(
      (failure) {
        emit(FailureRegisterState(error: failure.failureMessage));
      },
      (register) {
        emit(SuccessRegisterState(registerEntity: register));
      },
    );
  }
}
