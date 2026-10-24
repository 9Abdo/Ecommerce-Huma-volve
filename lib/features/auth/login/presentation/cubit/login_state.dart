import 'package:ecommerce_app_huma_volve/features/auth/login/domains/entitiy/login_entity.dart';

abstract class LoginState {}

class InitLogin extends LoginState {}

class LoadinLogin extends LoginState {}

class SuccessLogin extends LoginState {
  final LoginEntity loginEntity;

  SuccessLogin({required this.loginEntity});
}

class FailureLogIn extends LoginState {
  final String error;

  FailureLogIn({required this.error});
}
