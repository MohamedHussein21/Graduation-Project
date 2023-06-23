import 'package:brain_tumor/features/authentication/domain/entities/register.dart';

class UserModel extends Auth {
  const UserModel({
    required super.firstName,
    required super.lastName,
    required super.specialty,
    required super.email, required super.token});

  factory UserModel.fromjson(Map<String, dynamic>? json) =>
      UserModel(
          firstName: json!['first_name'],
          lastName: json['last_name'],
          specialty: json['specialty'],
          email: json['email'],
          token:json['token'] );


  Map<String, dynamic> toMap() {
    return {
      'token' : token,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'specialty': specialty,
    };
  }
}


