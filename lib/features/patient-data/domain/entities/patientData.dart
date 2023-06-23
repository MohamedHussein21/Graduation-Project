
import 'package:equatable/equatable.dart';

class PatientData extends Equatable {
  final String image;
  final double tumorSize;
  final String predictedLabel;
  final String doctorName;
  final String patientId;
  final String uploadTime;
  final int nationalId;
  final int phoneNumber;
  final int age;
  final String name;

  const PatientData({
    required this.image,
    required this.tumorSize,
    required this.predictedLabel,
    required this.doctorName,
    required this.patientId,
    required this.uploadTime,
    required this.nationalId,
    required this.phoneNumber,
    required this.age,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        age,
        nationalId,
        tumorSize,
        image,
        predictedLabel,
        doctorName,
        patientId,
        uploadTime,
        phoneNumber
      ];
}
