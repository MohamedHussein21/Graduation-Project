import 'package:brain_tumor/core/utils/color_mange.dart';
import 'package:brain_tumor/features/authentication/data/models/outh_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, stata) {},
      builder: (context, stata) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          body: cubit.pages[cubit.pageIndex],
          bottomNavigationBar: Container(
            height: 70,
            decoration: BoxDecoration(
              color: ColorManger.wightColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    cubit.changeBottom(cubit.pageIndex=0);
                  },
                  icon: cubit.pageIndex == 0
                      ? Icon(
                          Icons.home_filled,
                          color: ColorManger.defaultColor,
                          size: 35,
                        )
                      : Icon(
                          Icons.home_outlined,
                          color: ColorManger.defaultColor,
                          size: 30,
                        ),
                ),
                IconButton(
                  onPressed: () {

                  cubit.changeBottom(cubit.pageIndex=1);
                  },
                  icon: cubit.pageIndex == 1
                      ? Icon(
                          Icons.person,
                          color: ColorManger.defaultColor,
                          size: 35,
                        )
                      : Icon(
                          Icons.person_2_outlined,
                          color: ColorManger.defaultColor,
                          size: 35,
                        ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.changeBottom(cubit.pageIndex=2);
                  },
                  icon: cubit.pageIndex == 2
                      ? Icon(
                          Icons.event_note,
                          color: ColorManger.defaultColor,
                          size: 35,
                        )
                      : Icon(
                          Icons.event_note_outlined,
                          color: ColorManger.defaultColor,
                          size: 35,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
