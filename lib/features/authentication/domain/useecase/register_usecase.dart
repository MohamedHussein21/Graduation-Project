import 'package:brain_tumor/features/authentication/domain/entities/register.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../repository/auth_repo.dart';

class RegisterUseCase {
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase(this.baseAuthRepository);

  Future<Either<Failure, Auth>> execute({
    required String firstName,
    required String lastName,
    required String email,
    required String specialty,
    required String password,
  }) async {
    return await baseAuthRepository.userRegister(
        firstName: firstName,
        lastName: lastName,
        email: email,
        specialty: specialty,
        password: password);
  }
}
