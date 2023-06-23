
import 'package:brain_tumor/features/authentication/domain/entities/register.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../repository/auth_repo.dart';

class LoginUseCase {

  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  Future<Either<Failure,Auth>> execute( {required String email, required String password}) async {
    return await baseAuthRepository.userLogin(email, password);
  }

}