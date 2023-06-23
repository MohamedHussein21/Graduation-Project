

import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';

abstract class BasePatientRepository {
  Future<Either<Failure,PatientData>> uploadPatientData({
    required String filepath,
    required String filename,
    required String name,
    required bool isNew,
    required String token,
    required int age,
    required int phone,
    required int nationalId
  });






}
