
import 'package:equatable/equatable.dart';

class HistoryData extends Equatable {
  final String patientId;
  final String name;
  final int age;
  final String phoneNumber;
  final String nationalId;
  final List<String> history;
  final List<String> doctorName;
  final List<String> uploadTimes;

  const HistoryData({
    required this.patientId,
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.nationalId,
    required this.history,
    required this.doctorName,
    required this.uploadTimes,});

  @override
  // TODO: implement props
  List<Object?> get props => [patientId,name, age, nationalId, phoneNumber,history,doctorName,uploadTimes];
}
