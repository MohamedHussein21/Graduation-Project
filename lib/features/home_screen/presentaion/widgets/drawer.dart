import 'package:brain_tumor/core/helper/cash_helper.dart';
import 'package:brain_tumor/core/utils/constant.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/features/about_us/pages/about_us.dart';
import 'package:brain_tumor/features/contact_us/pages/contact_us_screen.dart';
import 'package:brain_tumor/features/notification/pages/notification_screen.dart';
import 'package:brain_tumor/features/peofile_scrren/presentation/cubit/Profile_state.dart';
import 'package:brain_tumor/features/terms/pages/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/constatnt.dart';
import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/font_mange.dart';
import '../../../../core/utils/images_mange.dart';
import '../../../authentication/presentation/pages/login_screen.dart';
import '../../../authentication/presentation/widgets/defauldButton.dart';
import '../../../history_screen/presentation/pages/history_screen.dart';
import '../../../peofile_scrren/presentation/cubit/Profile_cubit.dart';


class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManger.bodyColor,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.all(context.toPadding * 1.3),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1684507645~exp=1684508245~hmac=99b9a73687f86b3eca91ec10493837da7809b81a771782b10518021dcf0248e2'),
              ),
              SizedBox(
                width: context.width * 0.05,
              ),
              BlocProvider(
                create: (context) => ProfileCubit()..gerProfileData(token: Constant.token!),
                child: BlocConsumer<ProfileCubit,ProfileState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if(state is ProfileSuccessState) {
                      return  Text(
                      '${state.profileModel.firstName} ${state.profileModel.lastName}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeightManger.bold,
                          color: ColorManger.defaultColor),
                    );
                    }
                    else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: context.heigh * 0.02,
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              Constants.navigateTo(context, const HistoryScreen());

            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              ImageAssets.notificationIcon,
            ),
            title: const Text('Notification'),
            onTap: () {
              Constants.navigateTo(context, const NotificationScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              ImageAssets.aboutUsIcon,
            ),
            title: const Text('About Us'),
            onTap: () {
              Constants.navigateTo(context, const AboutUsScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              ImageAssets.contactUsIcon,
            ),
            title: const Text('Contact Us '),
            onTap: () {
              Constants.navigateTo(context, const ContactUSScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(
              ImageAssets.conditionIcon,
            ),
            title: const Text('Terms & Condition'),
            onTap: () {
              Constants.navigateTo(context, const TermsScreen());
            },
          ),
          SizedBox(height: context.heigh*0.23,),
          DefaultButton(width: 200,submit: (){
            CashHelper.removeData(key: 'token');
            Constants.navigateAndFinish(context, const LoginScreen());
          },title: 'Logout ',)
        ],
      ),
    );
  }
}




