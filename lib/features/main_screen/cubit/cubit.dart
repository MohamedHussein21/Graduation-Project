import 'package:brain_tumor/features/main_screen/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../history_screen/presentation/pages/history_screen.dart';
import '../../home_screen/presentaion/pages/home_screen.dart';
import '../../peofile_scrren/presentation/pages/profile_screen.dart';


class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialStates());

  static MainCubit get(context) => BlocProvider.of(context);


  int pageIndex = 0;
  final pages = [
     const HomeScreen(),
    const ProfileScreen(),
    const HistoryScreen(),
  ];

  void changeBottom(int index) {
    pageIndex = index;
    emit(MainChangButtonNavStates());


  }

}
