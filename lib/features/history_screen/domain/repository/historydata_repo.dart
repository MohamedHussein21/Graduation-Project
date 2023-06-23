
import 'package:brain_tumor/features/history_screen/domain/entities/historyData.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';

abstract class BaseHistoryRepository {
  Future<Either<Failure,HistoryData>> getHistoryData({
    required String phone,
    required String nationalId,
  });






}
