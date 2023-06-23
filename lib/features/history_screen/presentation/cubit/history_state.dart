import 'package:equatable/equatable.dart';

import '../../data/models/historyModel.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistorySuccessState extends HistoryState {
  final HistoryModel patientModel ;

  const HistorySuccessState(this.patientModel,);
}

class HistoryErrorState extends HistoryState {
  final String error;

  const HistoryErrorState(this.error);
}






