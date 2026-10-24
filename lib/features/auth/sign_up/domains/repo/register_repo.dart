import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/failure/failure.dart';
import 'package:ecommerce_app_huma_volve/features/auth/sign_up/data/models/register_request.dart';

import 'package:ecommerce_app_huma_volve/features/auth/sign_up/domains/entity/register_entity.dart';

abstract class RegisterRepo {
  Future<Either<FailureApp, RegisterEntity>> register(
    RegisterRequest registerRequest,
  );
}
