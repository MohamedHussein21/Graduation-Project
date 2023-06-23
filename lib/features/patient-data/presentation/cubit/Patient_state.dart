import 'package:brain_tumor/features/patient-data/data/models/patientModel.dart';
import 'package:equatable/equatable.dart';

abstract class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

class PatientInitial extends PatientState {}

class PatientLoadingState extends PatientState {}

class PatientSuccessState extends PatientState {
  final PatientModel patientModel ;

  const PatientSuccessState(this.patientModel,);
}

class PatientErrorState extends PatientState {
  final String error;

  const PatientErrorState(this.error);
}
class GetImageLoadingState extends PatientState {}

class GetImageSuccessState extends PatientState {}

class GetImageErrorState extends PatientState {
  final String error;

  const GetImageErrorState(this.error);
}





