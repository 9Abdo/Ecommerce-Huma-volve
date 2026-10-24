import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/storage/storage_helper.dart';
import '../datasource/remote_log_in_data_source.dart';
import '../../domains/entitiy/login_entity.dart';
import '../../domains/repo/log_in_repo_domain.dart';

import '../../../../../core/error/error_handling.dart';

class LogInRepoImplement implements LogInRepoDomain {
  final RemoteLogInDataSource remoteLogInDataSource;

  new({required this.remoteLogInDataSource});
  @override
  Future<Either<FailureApp, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteLogInDataSource.login(
        email: email,
        password: password,
      );
      await StorageHelper.saveAccessToken(response.accessToken);
      await StorageHelper.saveRefreshToken(response.refreshToken);
      return Right(response as LoginEntity);
    } catch (e) {
      return Left(
        ErrorHandler.getErrorMessage(
          e is Exception ? e : Exception(e.toString()),
        ),
      );
    }
  }
}
