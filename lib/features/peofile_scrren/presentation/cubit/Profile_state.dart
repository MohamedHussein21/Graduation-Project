import 'package:equatable/equatable.dart';

import '../../data/models/profileModel.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final ProfileModel profileModel ;

  const ProfileSuccessState(this.profileModel,);
}

class ProfileErrorState extends ProfileState {
  final String error;

  const ProfileErrorState(this.error);
}






