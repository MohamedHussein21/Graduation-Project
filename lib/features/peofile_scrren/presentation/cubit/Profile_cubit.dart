
import 'package:brain_tumor/features/peofile_scrren/presentation/cubit/Profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../data/models/profileModel.dart';
import '../../data/repo/Profile_repo.dart';
import '../../domain/repository/profiledata_repo.dart';
import '../../domain/useecase/profileData_usecase.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  void gerProfileData({
    required String token,

  }) async {
    emit(ProfileLoadingState());
    BaseProfileRemoteDataSource baseProfileRemoteDataSource = RemoteProfileDataSource();
    BaseProfileRepository baseProfileRepository = ProfileRepo(
        baseProfileRemoteDataSource);
    final result = await ProfileUseCase(baseProfileRepository)
        .execute(
        token: token,
      );
    result.fold((l) => emit(ProfileErrorState(l.massage)),
            (r) {
          emit(ProfileSuccessState(r as ProfileModel));
        });
  }










}

