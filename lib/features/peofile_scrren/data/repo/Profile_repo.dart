
import 'package:brain_tumor/core/errors/Failure.dart';

import 'package:brain_tumor/features/peofile_scrren/domain/entities/profileData.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_excption.dart';
import '../../domain/repository/profiledata_repo.dart';
import '../data_source/remote_data_source.dart';

class ProfileRepo extends BaseProfileRepository {
  final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

  ProfileRepo(this.baseProfileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileData>> getProfileData({
    required String token,

  }) async{
    final result = await baseProfileRemoteDataSource.getProfileData(
      token:token,

        );

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(FailureServer(massage: failure.errorModel.detail));
    }
  }





}
