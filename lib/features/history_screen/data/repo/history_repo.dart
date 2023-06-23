import 'dart:io';

import 'package:brain_tumor/core/errors/Failure.dart';
import 'package:brain_tumor/features/history_screen/domain/entities/historyData.dart';

import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_excption.dart';
import '../../domain/repository/historydata_repo.dart';
import '../data_source/remote_data_source.dart';

class HistoryRepo extends BaseHistoryRepository {
  final BaseHistoryRemoteDataSource baseHistoryRemoteDataSource;

  HistoryRepo(this.baseHistoryRemoteDataSource);

  @override
  Future<Either<Failure, HistoryData>> getHistoryData(
      {
      required String phone,
      required String nationalId}) async {
    final result = await baseHistoryRemoteDataSource.getHistoryData(
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
