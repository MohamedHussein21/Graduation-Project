

import 'package:brain_tumor/features/history_screen/domain/entities/historyData.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/Failure.dart';
import '../repository/historydata_repo.dart';

class HistoryUseCase {
  final BaseHistoryRepository baseHistoryRepository;

  HistoryUseCase(this.baseHistoryRepository);

  Future<Either<Failure, HistoryData>> execute({
    required String phone,
    required String nationalId,
  }) async {
    return await baseHistoryRepository.getHistoryData(
        phone: phone,
        nationalId: nationalId,
        );
  }
}
