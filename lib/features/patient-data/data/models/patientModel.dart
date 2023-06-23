import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';

class PatientModel extends PatientData {
  const PatientModel({required super.image, required super.tumorSize, required super.predictedLabel, required super.doctorName, required super.patientId, required super.uploadTime, required super.nationalId, required super.phoneNumber, required super.age, required super.name});

  factory PatientModel.fromjson(Map<String, dynamic>? json) =>
      PatientModel(
        image: json!['image'],
        tumorSize: json['tumor_size'],
        predictedLabel: json['predicted_label'],
        doctorName: json['doctor_name'],
        patientId: json['patient_id'],
        uploadTime: json['upload_time'],
        nationalId: json['national_id'],
        phoneNumber: json['phone_number'],
        age: json['age'],
        name: json['name'],);


  Map<String, dynamic> toMap() {
    return {
      'image' : image,
      'tumor_size' : tumorSize,
      'predicted_label': predictedLabel,
      'doctor_name': doctorName,
      'patient_id': patientId,
      'upload_time': uploadTime,
      'phone_number': phoneNumber,
      'age': age,
      'name': name,
    };
  }
}


