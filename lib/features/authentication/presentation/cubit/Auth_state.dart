import 'package:brain_tumor/features/authentication/data/models/outh_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserModel userModel ;
  final String token;

  const LoginSuccessState(this.userModel, this.token);
}




class LoginErrorState extends AuthState {

  final String error;
  const LoginErrorState(this.error);
}

class ChangePassIconLoadingState extends AuthState {}

class ChangePassIconState extends AuthState {}


class RegisterInitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserModel userModel ;

  const RegisterSuccessState(this.userModel);
}

class RegisterErrorState extends AuthState {
  final String error;

  const RegisterErrorState(this.error);

}
class CreateUserSuccessState extends AuthState {}

class CreateUserErrorState extends AuthState {
  final String error;

  const CreateUserErrorState(this.error);
}


class RegisterChangePassIconState extends AuthState {}
