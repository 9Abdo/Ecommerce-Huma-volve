import 'package:dartz/dartz.dart';
import '../entity/register_entity.dart';
import '../repo/register_repo.dart';

import '../../../../../core/failure/failure.dart';
import '../../data/models/register_request.dart';
class RegisterUseCase {
  final RegisterRepo registerRepo;

  RegisterUseCase({required this.registerRepo});
  Future<Either<FailureApp, RegisterEntity>> invoke(
    RegisterRequest registerRequest,
  ) => registerRepo.register(registerRequest);
}
