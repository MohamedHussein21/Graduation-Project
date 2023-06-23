import 'package:brain_tumor/core/helper/constatnt.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/core/utils/validator.dart';
import 'package:brain_tumor/features/forget_Password/widgets/default_appBar.dart';
import 'package:brain_tumor/features/patient-data/presentation/cubit/Patient_cubit.dart';
import 'package:brain_tumor/features/patient-data/presentation/cubit/Patient_state.dart';
import 'package:brain_tumor/features/patient-data/presentation/pages/result.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/cash_helper.dart';
import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/font_mange.dart';
import '../../../../core/utils/images_mange.dart';
import '../../../authentication/presentation/widgets/defauldButton.dart';
import '../../../authentication/presentation/widgets/defaultFormField.dart';
import '../widgets/textform.dart';

class PatientData extends StatefulWidget {
  final bool isNew;

  const PatientData({Key? key, required this.isNew}) : super(key: key);

  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> with Validations {
  final GlobalKey<FormState> formKey = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var nameController = TextEditingController();
  var idController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();
  String? token = CashHelper.getData(key: 'token');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientCubit(),
      child: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          if(state is PatientSuccessState){
            Constants.navigateTo(context,  ResultScreen(patientModel: state.patientModel,));
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: defaultAppBar(text: 'Patient Data'),
            body: Padding(
              padding: EdgeInsets.all(context.toPadding),
              child: SingleChildScrollView(
                child: BuildCondition(
                    condition: widget.isNew,
                    builder: (context) {
                      return Column(
                        children: [
                          DefaultTextForm(
                              controller: nameController,
                              isPassword: false,
                              type: TextInputType.name,
                              validate: generalValidation,
                              label: 'Patient Name',
                              labelStyle:
                                  TextStyle(color: ColorManger.defaultColor),
                              prefix: Icons.person_2_outlined),
                          SizedBox(
                            height: context.heigh * 0.03,
                          ),
                          DefaultTextForm(
                              controller: idController,
                              isPassword: false,
                              type: TextInputType.number,
                              validate: generalValidation,
                              label: 'Patient Id',
                              labelStyle:
                                  TextStyle(color: ColorManger.defaultColor),
                              prefix: Icons.call_to_action_rounded),
                          SizedBox(
                            height: context.heigh * 0.03,
                          ),
                          DefaultTextForm(
                              controller: phoneController,
                              isPassword: false,
                              type: TextInputType.phone,
                              validate: generalValidation,
                              label: ' Phone',
                              labelStyle:
                                  TextStyle(color: ColorManger.defaultColor),
                              prefix: Icons.phone),
                          SizedBox(
                            height: context.heigh * 0.03,
                          ),
                          DefaultTextForm(
                              controller: ageController,
                              isPassword: false,
                              type: TextInputType.number,
                              validate: generalValidation,
                              label: 'Age',
                              labelStyle:
                                  TextStyle(color: ColorManger.defaultColor),
                              prefix: Icons.personal_injury_outlined),
                          SizedBox(
                            height: context.heigh * 0.03,
                          ),
                          Text(
                            'Upload Image From :',
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorManger.defaultColor,
                                fontWeight: FontWeightManger.bold),
                          ),
                          buildfixedform(
                            context,
                            onTap: () {},
                            text: 'Google Drive',
                            widget: Image.asset(ImageAssets.googleDrive),
                          ),
                          BuildCondition(
                              condition: state is! GetImageLoadingState,
                              builder: (context) {
                                return buildfixedform(
                                  context,
                                  onTap: () {
                                    PatientCubit.get(context).pickImage();
                                  },
                                  text: 'Your Device',
                                  widget: Image.asset(ImageAssets.smartphone),
                                );
                              },
                              fallback: (context) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }),
                          SizedBox(
                            height: context.heigh * 0.03,
                          ),
                          BuildCondition(
                              condition: state is! PatientLoadingState,
                              builder: (context) {
                                return DefaultButton(
                                  width: context.width,
                                  title: 'Upload MRI',
                                  submit: () {
                                    PatientCubit.get(context).uploadFile(
                                      name: nameController.text,
                                      age: int.parse(ageController.text),
                                      phone: int.parse(phoneController.text),
                                      nationalId: int.parse(idController.text),
                                      token: Constant.token!,
                                      isNew: widget.isNew,
                                      filepath: PatientCubit.get(context)
                                          .imageFile!
                                          .path,
                                      filename: PatientCubit.get(context)
                                          .imageName!
                                          .path,
                                    );
                                  },
                                );
                              },
                              fallback: (context) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }),
                        ],
                      );
                    },
                    fallback: (context) {
                      return Column(
                        children: [
                          DefaultTextForm(
                              controller: idController,
                              isPassword: false,
                              type: TextInputType.number,
                              validate: generalValidation,
                              label: 'Patient Id',
                              labelStyle:
                                  TextStyle(color: ColorManger.defaultColor),
                              prefix: Icons.call_to_action_rounded),
                          SizedBox(
                            height: context.heigh * 0.03,
                          ),
                          Text(
                            'Upload Image From :',
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorManger.defaultColor,
                                fontWeight: FontWeightManger.bold),
                          ),
                          buildfixedform(
                            context,
                            onTap: () {},
                            text: 'Google Drive',
                            widget: Image.asset(ImageAssets.googleDrive),
                          ),
                          BuildCondition(
                              condition: state is! GetImageLoadingState,
                              builder: (context) {
                                return buildfixedform(
                                  context,
                                  onTap: () {
                                    PatientCubit.get(context).pickImage();
                                  },
                                  text: 'Your Device',
                                  widget: Image.asset(ImageAssets.smartphone),
                                );
                              },
                              fallback: (context) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }),
                          DefaultButton(
                            width: context.width,
                            title: 'Upload MRI',
                            submit: () {
                              PatientCubit.get(context).uploadFile(
                                name: nameController.text,
                                age: int.parse(ageController.text),
                                phone: int.parse(phoneController.text),
                                nationalId: int.parse(idController.text),
                                token: Constant.token!,
                                isNew: widget.isNew,
                                filepath:
                                    PatientCubit.get(context).imageFile!.path,
                                filename:
                                    PatientCubit.get(context).imageName!.path,
                              );
                            },
                          )
                        ],
                      );
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}
