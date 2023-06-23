
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/models/historyModel.dart';
import '../../data/repo/history_repo.dart';
import '../../domain/repository/historydata_repo.dart';
import '../../domain/useecase/historyData_usecase.dart';
import 'history_state.dart';


class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  static HistoryCubit get(context) => BlocProvider.of(context);

  void getHistoryData({
    required String phone,
    required String nationalId
  }) async {
    emit(HistoryLoadingState());
    BaseHistoryRemoteDataSource baseHistoryRemoteDataSource = RemoteHistoryDataSource();
    BaseHistoryRepository baseHistoryRepository = HistoryRepo(
        baseHistoryRemoteDataSource);
    final result = await HistoryUseCase(baseHistoryRepository)
        .execute(
        phone: phone,
        nationalId: nationalId);
    result.fold((l) => emit(HistoryErrorState(l.massage)),
            (r) {
          emit(HistorySuccessState(r as HistoryModel));
        });
  }


}

