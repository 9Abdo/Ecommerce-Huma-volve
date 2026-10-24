import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domains/entity/register_entity.dart';

class RegisterState {}

class RegisterInitState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  final RegisterEntity registerEntity;

  SuccessRegisterState({required this.registerEntity});
}

class FailureRegisterState extends RegisterState {
  final String error;

  FailureRegisterState({required this.error});
}
