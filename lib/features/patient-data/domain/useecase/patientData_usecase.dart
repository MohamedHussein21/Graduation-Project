

import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../repository/patientdata_repo.dart';

class PatientUseCase {
  final BasePatientRepository basePatientRepository;

  PatientUseCase(this.basePatientRepository);

  Future<Either<Failure, PatientData>> execute({
    required String filepath,
    required String filename,
    required String name,
    required bool isNew,
    required String token,
    required int age,
    required int phone,
    required int nationalId
  }) async {
    return await basePatientRepository.uploadPatientData(
      token:token,
      isNew:isNew,
        name: name,
        filename: filename,
        filepath: filepath,
        age: age,
        phone: phone,
        nationalId: nationalId,
        );
  }
}
