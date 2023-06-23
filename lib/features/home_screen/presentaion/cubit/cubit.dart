import 'package:brain_tumor/core/network/api_constant.dart';
import 'package:brain_tumor/features/home_screen/presentaion/cubit/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/server_excption.dart';
import '../../../../core/network/error_model.dart';
import '../../../authentication/data/models/outh_model.dart';



class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeStates());

  static HomeCubit get(context) => BlocProvider.of(context);


  // Future<UserModel> getUserData() async{
  //   emit(HomeLoadingState());
  //     final response = await Dio().get(ApiConstant.userData);
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = response.data;
  //       if (data.isEmpty) {
  //         throw Exception('Data is empty');
  //       }
  //       userModel = UserModel.fromjson(data as Map<String, dynamic>?);
  //       emit(HomeGetUserSuccessStates(userModel!));
  //       return UserModel.fromjson(response.data);
  //
  //     } else {
  //       throw ServerException(errorModel: ErrorModel.fromJson(response.data));
  //     }
  //   }
  }


