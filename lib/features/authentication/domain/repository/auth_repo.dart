import 'package:brain_tumor/features/authentication/domain/entities/register.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure,Auth>> userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String specialty,
    required String password,
  });

  Future<Either<Failure,Auth>> userLogin(
       String email,String password);




}
