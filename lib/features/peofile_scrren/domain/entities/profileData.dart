
import 'package:equatable/equatable.dart';

class ProfileData extends Equatable {
  final String token;
  final String firstName;
  final String lastName;
  final String email;
  final String specialty;
  final int passintNumber;

  const ProfileData({
    required this.firstName,
    required this.token,
      required this.lastName,
      required this.email,
      required this.specialty,
      required this.passintNumber,
     });

  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName, email, token,specialty,passintNumber];
}
