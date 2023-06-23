import 'package:brain_tumor/core/helper/cash_helper.dart';
import 'package:brain_tumor/core/utils/constant.dart';
import 'package:brain_tumor/core/utils/images_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/core/utils/validator.dart';
import 'package:brain_tumor/features/authentication/presentation/pages/login_screen.dart';
import 'package:brain_tumor/features/main_screen/pages/main_screen.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_mange.dart';
import '../cubit/Auth_cubit.dart';
import '../cubit/Auth_state.dart';
import '../widgets/defauldButton.dart';
import '../widgets/defaultFormField.dart';

enum SampleItem {
  hospital,
  radiologyLab,
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Validations {
  SampleItem? selectedMenu;
  bool isChecked = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var specialtyController = TextEditingController();
  var passwordController = TextEditingController();
  final List<String> dropdownValue = ['Specialty', 'hospital ', 'radiologyLab'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
        if (state is RegisterErrorState) {
          Constants.showToast(text: state.error, state: ToastStates.error);
        }
        if (state is RegisterSuccessState) {
          CashHelper.saveData(
              key: 'token', value: state.userModel.token)
              .then((value) {

          Constants.navigateAndFinish(context,   const LoginScreen());

          });
        }
      }, builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create New Account'),
          ),
          body: Padding(
            padding: EdgeInsets.all(context.toPadding),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        ImageAssets.register,
                      ),
                      SizedBox(
                        height: context.heigh * 0.02,
                      ),
                      DefaultTextForm(
                          controller: firstNameController,
                          isPassword: false,
                          type: TextInputType.text,
                          validate: generalValidation,
                          label: 'First Name',
                          labelStyle:
                              TextStyle(color: ColorManger.defaultColor),
                          prefix: Icons.person_outline),
                      SizedBox(
                        height: context.heigh * 0.02,
                      ),
                      DefaultTextForm(
                          controller: lastNameController,
                          isPassword: false,
                          type: TextInputType.emailAddress,
                          validate: generalValidation,
                          label: 'Last Name',
                          labelStyle:
                              TextStyle(color: ColorManger.defaultColor),
                          prefix: Icons.person_outline),
                      SizedBox(
                        height: context.heigh * 0.02,
                      ),
                      DropdownButtonFormField(
                          validator: generalValidation,
                          decoration: InputDecoration(
                            focusColor: ColorManger.defaultColor,
                            labelText: 'Specialty',
                            labelStyle:
                                TextStyle(color: ColorManger.defaultColor),
                            prefixIcon: const Icon(Icons.earbuds_battery_sharp),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorManger.defaultColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: <String>[
                            'hospital',
                            'radiologyLab',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            specialtyController.text = value!;
                            // currnydropdownValue = value;
                          }),
                      SizedBox(
                        height: context.heigh * 0.02,
                      ),
                      DefaultTextForm(
                          controller: emailController,
                          isPassword: false,
                          type: TextInputType.emailAddress,
                          validate: emailValidation,
                          label: 'E-mail',
                          labelStyle:
                              TextStyle(color: ColorManger.defaultColor),
                          prefix: Icons.email_outlined),
                      SizedBox(
                        height: context.heigh * 0.02,
                      ),
                      DefaultTextForm(
                        controller: passwordController,
                        isPassword: cubit.isShowPass,
                        type: TextInputType.emailAddress,
                        validate: passwordValidation,
                        label: 'Password',
                        labelStyle: TextStyle(color: ColorManger.defaultColor),
                        prefix: Icons.lock_open_outlined,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePassVisibility();
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Text(
                            'By Registering You Agree The ',
                            style: TextStyle(
                                color: ColorManger.defaultColor, fontSize: 10),
                          ),
                          Text(
                            ' Terms & Conditions.',
                            style: TextStyle(
                                color: ColorManger.redColor, fontSize: 10),
                          )
                        ],
                      ),
                      BuildCondition(
                          condition: state is! RegisterLoadingState,
                          builder: (context) {
                            return DefaultButton(
                              width: context.width,
                              submit: () {
                                if (formKey.currentState!.validate()) {
                                  AuthCubit.get(context).userRegister(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      email: emailController.text,
                                      specialty: specialtyController.text,
                                      password: passwordController.text);
                                }

                              },
                              title: 'Create',
                            );
                          },
                          fallback: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
