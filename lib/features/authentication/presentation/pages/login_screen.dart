import 'package:brain_tumor/core/helper/cash_helper.dart';
import 'package:brain_tumor/core/utils/color_mange.dart';
import 'package:brain_tumor/core/utils/constant.dart';
import 'package:brain_tumor/core/utils/images_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/features/authentication/presentation/pages/register_screen.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validator.dart';
import '../../../forget_Password/pages/forget_pass_Screen.dart';
import '../../../main_screen/pages/main_screen.dart';
import '../cubit/Auth_cubit.dart';
import '../cubit/Auth_state.dart';
import '../widgets/defauldButton.dart';
import '../widgets/defaultFormField.dart';
import '../widgets/welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validations {
  final GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            Constants.showToast(text: state.error, state: ToastStates.error);
          }
          if (state is LoginSuccessState) {
            CashHelper.saveData(key: 'token', value: state.userModel.token).then((value) {

              Constants.navigateAndFinish(context,   MainScreen());

            });

          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(context.toPadding),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Image.asset(ImageAssets.login),
                      SizedBox(
                        height: context.heigh * 0.03,
                      ),
                      const WelcomeText(),
                      SizedBox(
                        height: context.heigh * 0.03,
                      ),
                      DefaultTextForm(
                          controller: emailController,
                          isPassword: false,
                          type: TextInputType.emailAddress,
                          validate: emailValidation,
                          label: 'E-mail',
                          labelStyle: TextStyle(color: ColorManger.defaultColor),
                          prefix: Icons.email_outlined),
                      SizedBox(
                        height: context.heigh * 0.03,
                      ),
                      DefaultTextForm(
                        controller: passwordController,
                        isPassword: cubit.isShowPass,
                        type: TextInputType.visiblePassword,
                        validate: passwordValidation,
                        label: 'Password',
                        labelStyle: TextStyle(color: ColorManger.defaultColor),
                        prefix: Icons.lock_open,
                        suffix: cubit.suffix,
                        suffixPressed: (){
                          cubit.changePassVisibility();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Constants.navigateTo(
                                    context, const ForgetPasswordScreen());
                              },
                              child: Text(
                                'Forget your password?',
                                style: TextStyle(color: ColorManger.defaultColor),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: context.heigh * 0.22,
                      ),

                      BuildCondition(
                          condition: state is! LoginLoadingState ,
                          builder: (context) {
                            return    DefaultButton(
                              width: context.width,
                              submit: () {
                                if (formKey.currentState!.validate()) {
                                  AuthCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              title: 'Login',
                            );
                          },
                          fallback: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ?',
                              style: TextStyle(color: ColorManger.darkColor)),
                          TextButton(
                              onPressed: () {
                                Constants.navigateTo(
                                    context, const RegisterScreen());
                              },
                              child: Text(
                                'Create',
                                style: TextStyle(color: ColorManger.defaultColor),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
