import 'package:brain_tumor/core/errors/Failure.dart';
import 'package:brain_tumor/core/errors/server_excption.dart';
import 'package:brain_tumor/features/authentication/data/data_source/remote_data_source.dart';
import 'package:brain_tumor/features/authentication/domain/entities/register.dart';
import 'package:brain_tumor/features/authentication/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepo extends BaseAuthRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  AuthRepo(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, Auth>> userLogin(String email, String password) async {
    final result =
        await baseRemoteDataSource.userLogin(email: email, password: password);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(FailureServer(massage: failure.errorModel.detail));
    }
  }

  @override
  Future<Either<Failure, Auth>> userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String specialty,
    required String password,
  }) async {
    final result = await baseRemoteDataSource.userRegister(
      firstName: firstName,
      lastName: lastName,
      email: email,
      specialty: specialty,
      password: password,
    );

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(FailureServer(massage: failure.errorModel.detail));
    }
  }
}
