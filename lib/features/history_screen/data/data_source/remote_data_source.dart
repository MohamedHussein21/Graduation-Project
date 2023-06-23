
import 'package:brain_tumor/core/network/api_constant.dart';
import 'package:brain_tumor/features/history_screen/data/models/historyModel.dart';
import 'package:brain_tumor/features/history_screen/domain/entities/historyData.dart';
import 'package:brain_tumor/features/patient-data/data/models/patientModel.dart';
import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/server_excption.dart';
import '../../../../core/network/error_model.dart';

abstract class BaseHistoryRemoteDataSource {
  Future<HistoryData> getHistoryData({
    required String phone,
    required String nationalId,
  });
}

class RemoteHistoryDataSource extends BaseHistoryRemoteDataSource {
  @override
  Future<HistoryData> getHistoryData(
      {
      required String phone,
      required String nationalId,
      })async {
    final headers = { 'Content-Type': 'multipart/form-data',};
    final response = await Dio().post(
        ApiConstant.getHistoryData,
        options: Options(headers: headers,),
        data: {
          'mobile_number':phone,
          'national_id':nationalId,
        }
    );
    print(response);
    if (response.statusCode == 200) {
      return HistoryModel.fromjson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }

  }
}
