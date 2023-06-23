import 'package:brain_tumor/features/peofile_scrren/domain/entities/profileData.dart';

class ProfileModel extends ProfileData {
  const ProfileModel(
      {required super.firstName,
      required super.token,
      required super.lastName,
      required super.email,
      required super.specialty,
      required super.passintNumber});

  factory ProfileModel.fromjson(Map<String, dynamic>? json) =>
      ProfileModel(
          firstName: json!['first_name'],
          lastName: json['last_name'],
          token: json['token'],
          email: json['email'],
          specialty:json['specialty'],
          passintNumber:json['passint_number'],
      );


  Map<String, dynamic> toMap() {
      return {
          'token' : token,
          'first_name' : firstName,
          'last_name': lastName,
          'email': email,
          'specialty': specialty,
          'passint_number': passintNumber,

      };
  }
}
