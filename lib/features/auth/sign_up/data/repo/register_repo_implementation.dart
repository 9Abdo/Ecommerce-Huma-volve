import 'package:dartz/dartz.dart';
import '../../../../../core/failure/failure.dart';
import '../datasource/remote_register.dart';
import '../models/register_request.dart';
import '../../domains/entity/register_entity.dart';
import '../../domains/repo/register_repo.dart';

import '../../../../../core/error/error_handling.dart';

class RegisterRepoImplementation implements RegisterRepo {
  final RemoteRegister remoteRegister;

  RegisterRepoImplementation({required this.remoteRegister});
  @override
  Future<Either<FailureApp, RegisterEntity>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final response = await remoteRegister.register(registerRequest);
      return Right(response as RegisterEntity);
    } catch (e) {
      return Left(
        ErrorHandler.getErrorMessage(
          e is Exception ? e : Exception(e.toString()),
        ),
      );
    }
  }
}
