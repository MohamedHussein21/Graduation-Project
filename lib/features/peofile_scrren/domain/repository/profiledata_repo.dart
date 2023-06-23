
import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';
import 'package:brain_tumor/features/peofile_scrren/domain/entities/profileData.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure,ProfileData>> getProfileData({
    required String token,

  });






}
