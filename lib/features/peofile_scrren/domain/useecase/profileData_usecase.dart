

import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';
import 'package:brain_tumor/features/peofile_scrren/domain/entities/profileData.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../repository/profiledata_repo.dart';

class ProfileUseCase {
  final BaseProfileRepository baseProfileRepository;

  ProfileUseCase(this.baseProfileRepository);

  Future<Either<Failure, ProfileData>> execute({
    required String token,

  }) async {
    return await baseProfileRepository.getProfileData(
      token:token,

        );
  }
}
