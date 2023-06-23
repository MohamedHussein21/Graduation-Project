


import 'dart:io';

import 'package:brain_tumor/core/errors/Failure.dart';

import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_excption.dart';
import '../../domain/repository/patientdata_repo.dart';
import '../data_source/remote_data_source.dart';

class PatientRepo extends BasePatientRepository {
  final BasePatientRemoteDataSource basePatientRemoteDataSource;

  PatientRepo(this.basePatientRemoteDataSource);

  @override
  Future<Either<Failure, PatientData>> uploadPatientData({
    required String filepath,
    required String filename,
    required String name,
    required bool isNew,
    required String token,
    required int age,
    required int phone,
    required int nationalId
  }) async{
    final result = await basePatientRemoteDataSource.uploadPatientData(
      token:token,
      isNew:isNew,
      filename:filename,
      filepath:filepath,
        name: name,
        age: age,
        phone: phone,
        nationalId: nationalId,
        );

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(FailureServer(massage: failure.errorModel.detail));
    }
  }




}
