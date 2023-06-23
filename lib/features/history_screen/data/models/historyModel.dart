import 'package:brain_tumor/features/history_screen/domain/entities/historyData.dart';

class HistoryModel extends HistoryData {
  const HistoryModel(
      {required super.patientId,
      required super.name,
      required super.age,
      required super.phoneNumber,
      required super.nationalId,
      required super.history,
      required super.doctorName,
      required super.uploadTimes});

  factory HistoryModel.fromjson(Map<String, dynamic>? json) =>
      HistoryModel(
          patientId: json!['patient_id'],
          name: json['name'],
          age: json['age'],
          phoneNumber: json['phone_number'],
          nationalId: json['national_id'],
          history: List<String>.from(json['history']),
          doctorName: List<String>.from(json['doctorname']),
          uploadTimes: List<String>.from(json['upload_times']),
      );


  Map<String, dynamic> toMap() {
      return {
          'patient_id' : patientId,
          'history' : history,
          'name': name,
          'age': age,
          'phone_number': phoneNumber,
          'national_id': nationalId,
          'doctorname': doctorName,
          'upload_times': uploadTimes,
      };
  }
}


