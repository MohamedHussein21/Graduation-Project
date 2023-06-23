

import '../../../authentication/data/models/outh_model.dart';

abstract class HomeStates {}

class InitialHomeStates extends HomeStates {}

class LoadingHomeStates extends HomeStates {}

class HomeLoadingState extends HomeStates{}

class HomeGetUserSuccessStates extends HomeStates {
  final UserModel userModel;
  HomeGetUserSuccessStates(this.userModel);
}
class HomeGetUserErrorStates extends HomeStates {

  final String error;

  HomeGetUserErrorStates(this.error);
}