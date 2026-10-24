import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/login/domains/entitiy/login_entity.dart';

abstract class LogInRepoDomain {
  Future<Either<FailureApp, LoginEntity>> login({
    required String email,
    required String password,
  });
}
