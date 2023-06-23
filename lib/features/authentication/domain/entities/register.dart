import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String token;
  final String firstName;
  final String lastName;
  final String specialty;
  final String email;

  const Auth(
      {required this.firstName,
      required this.token,
      required this.lastName,
      required this.specialty,
      required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName, specialty, email,token];
}
