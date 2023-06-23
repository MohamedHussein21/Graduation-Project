
import 'package:brain_tumor/core/network/api_constant.dart';
import 'package:brain_tumor/features/authentication/data/models/outh_model.dart';
import 'package:brain_tumor/features/authentication/domain/entities/register.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/server_excption.dart';
import '../../../../core/network/error_model.dart';

abstract class BaseRemoteDataSource {
  Future<Auth> userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String specialty,
    required String password,});

  Future<Auth> userLogin({
    required String email,
    required String password,
});
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<UserModel> userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String specialty,
    required String password,
  }) async {
    final response = await Dio().post(
      ApiConstant.signUp,
      options: Options(headers: ApiConstant.headers,),
      data: {
        'first_name':firstName,
        'last_name':lastName,
        'email':email,
        'specialty':specialty,
        'password':password,
      }
    );
    if (response.statusCode == 200) {
      return UserModel.fromjson(response.data['data']);

    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<UserModel> userLogin({
    required String email,
    required String password,
}) async {
    final response = await Dio().post(
        ApiConstant.login,
        options: Options(headers: ApiConstant.headers,),
        data: {
          'email':email,
          'password':password,
        }

    );
    print(response);
    if (response.statusCode == 200) {
      return UserModel.fromjson(response.data['data']);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }

  }
}
