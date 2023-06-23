import 'package:brain_tumor/core/utils/color_mange.dart';
import 'package:brain_tumor/core/utils/font_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/features/peofile_scrren/presentation/cubit/Profile_cubit.dart';
import 'package:brain_tumor/features/peofile_scrren/presentation/cubit/Profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/cash_helper.dart';
import '../../../../core/helper/constatnt.dart';
import '../../../../core/utils/constant.dart';
import '../../../authentication/presentation/pages/login_screen.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..gerProfileData(token: Constant.token!),
      child: BlocConsumer<ProfileCubit,ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is ProfileSuccessState) {
            return Scaffold(
              appBar: Constants.gradientAppBar(txt: '${state.profileModel.firstName}${' '}${state.profileModel.lastName}'),
              body: Padding(
                padding: EdgeInsets.all(context.toPadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 100,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding:  const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${state.profileModel.passintNumber}',
                                    style: TextStyle(
                                        color: ColorManger.defaultColor,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: context.heigh * 0.02,
                                  ),
                                  Text(
                                    'Report',
                                    style: TextStyle(
                                        color: ColorManger.defaultColor,
                                        fontSize: 18,
                                        fontWeight: FontWeightManger.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 100,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${state.profileModel.passintNumber}',
                                    style: TextStyle(
                                        color: ColorManger.defaultColor,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: context.heigh * 0.02,
                                  ),
                                  Text(
                                    'Patient',
                                    style: TextStyle(
                                        color: ColorManger.defaultColor,
                                        fontSize: 18,
                                        fontWeight: FontWeightManger.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.heigh * 0.01,
                    ),
                    TextFormField(
                      enabled: false,
                      decoration:  InputDecoration(
                        label: Text(state.profileModel.email,),
                        prefixIcon: const Icon(Icons.call_to_action),
                      ),
                    ),
                    SizedBox(
                      height: context.heigh * 0.02,
                    ),
                    TextFormField(
                      enabled: false,
                      decoration:  InputDecoration(
                        label: Text(state.profileModel.specialty,),
                        prefixIcon: const Icon(Icons.call_to_action),
                      ),
                    ),
                    SizedBox(
                      height: context.heigh * 0.02,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.lock, color: Colors.grey,),
                        SizedBox(
                          width: context.width * 0.07,
                        ),
                        const Text('Change Password '),

                      ],
                    ),
                    const Divider(),
                    SizedBox(
                      height: context.heigh * 0.02,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.history, color: Colors.grey,),
                        SizedBox(
                          width: context.width * 0.07,
                        ),
                        const Text('History  '),

                      ],
                    ),
                    const Divider(),
                    SizedBox(
                      height: context.heigh * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        CashHelper.removeData(key: 'token');
                        Constants.navigateAndFinish(context, const LoginScreen());
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.logout, color: Colors.grey,),
                          SizedBox(
                            width: context.width * 0.07,
                          ),
                          const Text('Sign out  '),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else {
            return const Center(child: CircularProgressIndicator());
          }

          },
      ),
    );
  }
}
