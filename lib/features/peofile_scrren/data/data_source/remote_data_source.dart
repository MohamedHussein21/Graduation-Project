import 'package:brain_tumor/core/network/api_constant.dart';
import 'package:brain_tumor/features/peofile_scrren/data/models/profileModel.dart';

import 'package:dio/dio.dart';

import '../../../../core/errors/server_excption.dart';
import '../../../../core/network/error_model.dart';
import '../../domain/entities/profileData.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileData> getProfileData({required String token});
}

class RemoteProfileDataSource extends BaseProfileRemoteDataSource {
  @override
  Future<ProfileData> getProfileData({
    required String token,
  }) async {
    final response = await Dio().post(
      ApiConstant.getProfileData,
      options: Options(
        headers: ApiConstant.headers,
      ),
      data: {
        "token": token,
      },
    );
    print(response);
    if (response.statusCode == 200) {
      return ProfileModel.fromjson(response.data['user_data']);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
