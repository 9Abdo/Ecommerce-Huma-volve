import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domains/entitiy/login_entity.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domains/repo/log_in_repo_domain.dart';

class LogInUseCase {
  final LogInRepoDomain logInRepoDomain;

  LogInUseCase({required this.logInRepoDomain});
  Future<Either<FailureApp, LoginEntity>> invoke({
    required String email,
    required String password,
  }) => logInRepoDomain.login(email: email, password: password);
}
