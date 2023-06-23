import 'package:brain_tumor/features/authentication/data/data_source/remote_data_source.dart';
import 'package:brain_tumor/features/authentication/data/repo/auth_repo.dart';
import 'package:brain_tumor/features/authentication/domain/repository/auth_repo.dart';
import 'package:brain_tumor/features/authentication/domain/useecase/login_usecase.dart';
import 'package:brain_tumor/features/authentication/domain/useecase/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/outh_model.dart';
import 'Auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseAuthRepository baseAuthRepository = AuthRepo(baseRemoteDataSource);
    final result = await LoginUseCase(baseAuthRepository)
        .execute(email: email, password: password);
    result.fold((l) => emit(LoginErrorState(l.massage)), (r) {
      emit(LoginSuccessState(r as UserModel, r.token));
      userModel = r as UserModel;
    });
  }

  bool isShowPass = true;

  IconData suffix = Icons.visibility_outlined;

  void changePassVisibility() {
    emit(ChangePassIconLoadingState());
    isShowPass = !isShowPass;
    suffix =
        isShowPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePassIconState());
  }

  UserModel? userModel;

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String specialty,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseAuthRepository baseAuthRepository = AuthRepo(baseRemoteDataSource);
    final result = await RegisterUseCase(baseAuthRepository).execute(
        firstName: firstName,
        lastName: lastName,
        email: email,
        specialty: specialty,
        password: password);
    result.fold((l) => emit(RegisterErrorState(l.massage)), (r) {
      emit(RegisterSuccessState(r as UserModel));
      userModel = r;
    });
  }
}
