
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/models/patientModel.dart';
import '../../data/repo/Patient_repo.dart';
import '../../domain/repository/patientdata_repo.dart';
import '../../domain/useecase/patientData_usecase.dart';
import 'Patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  static PatientCubit get(context) => BlocProvider.of(context);

  void uploadPatientData({
    required String filepath,
    required String filename,
    required String name,
    required bool isNew,
    required String token,
    required int age,
    required int phone,
    required int nationalId
  }) async {
    emit(PatientLoadingState());
    BasePatientRemoteDataSource basePatientRemoteDataSource = RemotePatientDataSource();
    BasePatientRepository basePatientRepository = PatientRepo(
        basePatientRemoteDataSource);
    final result = await PatientUseCase(basePatientRepository)
        .execute(
        token: token,
        filepath: filepath,
        filename: filename,
        isNew: isNew,
        name: name,
        phone: phone,
        age: age,
        nationalId: nationalId);
    result.fold((l) => emit(PatientErrorState(l.massage)),
            (r) {
          emit(PatientSuccessState(r as PatientModel));
        });
  }

  File? imageName;
  File? imageFile;
  PickedFile? pickedFile;
  final ImagePicker picker = ImagePicker();

 Future <void> pickImage() async {
    emit(GetImageLoadingState());
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      emit(GetImageSuccessState());
      if(pickedFile != null) {

        imageFile = File(pickedFile.path);
         imageName = File(pickedFile.name);
      }
    } catch (e) {
      emit(GetImageErrorState(e.toString()));
      print(e);
    }
  }


  // XFile? imageFile;
  // final picker = ImagePicker();
  // void getMRIImage() async {
  //   emit(GetImageLoadingState());
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     var image =await MultipartFile.fromFile(pickedFile.path, filename: pickedFile.name,);
  //     emit(GetImageSuccessState());
  //     imageFile = XFile(image.path );
  //     print(imageFile);
  //   }
  //   else {
  //     emit(const GetImageErrorState("Error: No Image Selected"));
  //   }
  // }

// Future<String> uploadData() async {
//   emit(GetImageLoadingState());
//   try {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     FormData formData = FormData.fromMap({
//       "file": await MultipartFile.fromFile(pickedFile!.path,filename: pickedFile.name),
//
//     });
//
//     Response response = await Dio().post(
//       ApiConstant.uploadPatientData,
//       data: formData,
//       options: Options(
//         headers:  {
//           'Content-Type': 'multipart/form-data',
//         },
//       )
//     );
//
//     emit(GetImageSuccessState());
//     return response.statusMessage ?? "";
//   } catch (e) {
//     emit(GetImageErrorState(e.toString()));
//     throw Exception(e);
//   }
// }


  void uploadFile({
    required String filepath,
    required String filename,
    required String name,
    required bool isNew,
    required String token,
     required int age,
    required int phone,
    required int nationalId}) async {
    emit(PatientLoadingState());
    BasePatientRemoteDataSource baseProfileRemoteDataSource = RemotePatientDataSource();
    BasePatientRepository baseProfileRepository = PatientRepo(
        baseProfileRemoteDataSource);
    final result = await PatientUseCase(baseProfileRepository)
        .execute(
      token: token,
      filepath: filepath,
      filename: filename,
      name: name,
      isNew: isNew,
      age: age,
      phone: phone,
      nationalId: nationalId,
    );
    result.fold((l) => emit(PatientErrorState(l.massage)),
            (r) {
          emit(PatientSuccessState(r as PatientModel));
        });
  }





}

