import 'package:brain_tumor/config/themes/app_theme.dart';
import 'package:brain_tumor/core/helper/cash_helper.dart';
import 'package:brain_tumor/features/main_screen/cubit/cubit.dart';
import 'package:brain_tumor/features/main_screen/pages/main_screen.dart';
import 'package:brain_tumor/features/splach/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helper/bloc_observer.dart';
import 'features/authentication/presentation/pages/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();

  Widget widget;

  bool? onBoarding = CashHelper.getData(key: 'OnBoarding');

  String? token = CashHelper.getData(key: 'token');
  print (token);


  if(onBoarding !=null) {
    if (token !=null) {
      widget =  const MainScreen();
    } else {
      widget = const LoginScreen();
    }
  }else {
    widget = const SplashScreen();
  }
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key,  required this.startWidget,}) ;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MainCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brain Tumor',
        theme: appTheme(),
         home:startWidget,
      ),
    );
  }
}
