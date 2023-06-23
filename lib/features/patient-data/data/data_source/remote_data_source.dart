
import 'package:brain_tumor/core/network/api_constant.dart';
import 'package:brain_tumor/features/patient-data/data/models/patientModel.dart';
import 'package:brain_tumor/features/patient-data/domain/entities/patientData.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/server_excption.dart';
import '../../../../core/network/error_model.dart';

abstract class BasePatientRemoteDataSource {
  Future<PatientData> uploadPatientData({
    required String filepath,
    required String filename,
    required String name,
    required bool isNew,
    required String token,
    required int age,
    required int phone,
    required int nationalId
  });
}

class RemotePatientDataSource extends BasePatientRemoteDataSource {
  @override
  Future<PatientData> uploadPatientData(
      { required String filepath,
        required String filename,
        required String name,
        required bool isNew,
        required String token,
        required int age,
        required int phone,
        required int nationalId
      })async {
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filepath, filename: filename),
      "age": age,
      "name": name,
      "is_new": isNew,
      "national_id": nationalId,
      "phone_number": phone,
      "doctor_token": token,
    });
    Response response = await dio.post(
      ApiConstant.uploadPatientData,
      data: formData,
      options: Options(
        headers: {
          "accept": "application/json",
          "Content-Type": "multipart/form-data",
        },
      ),
    );
    print(response);
    if (response.statusCode == 200) {
      return PatientModel.fromjson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }

  }
}
