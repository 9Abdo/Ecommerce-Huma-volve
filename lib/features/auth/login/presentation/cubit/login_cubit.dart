
import 'package:ecommerce_app_huma_volve/features/auth/login/domains/usecase/log_in_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.logInUseCase}) : super(InitLogin());
  final LogInUseCase logInUseCase;
  Future login({required String email, required String password}) async {
    emit(LoadinLogin());
    final loginResponse = await logInUseCase.invoke(
      email: email,
      password: password,
    );
    loginResponse.fold(
      (failure) {
        emit(FailureLogIn(error: failure.failureMessage));
      },
      (response) {
        emit(SuccessLogin(loginEntity: response));
      },
    );
  }
}
