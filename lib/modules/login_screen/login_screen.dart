import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/core/language/app_localization/app_localization.dart';
import 'package:talaky_app/layout/home_layout.dart';
import 'package:talaky_app/modules/login_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/login_screen/cubit/states.dart';
import 'package:talaky_app/modules/register_screen/register_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import 'package:talaky_app/shared/componants/constants.dart';
import 'package:talaky_app/shared/network/local/cachehelper/cache_helper.dart';

import '../../shared/ui/resources/app_colors.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(
            key: 'token',
            value: state.loginModel.token,
          ).then((value) {
            token = state.loginModel.token!;
            navigateAndFinish(context, HomeLayout());
          });
        } else {}
      },
      builder: (context, state) => Scaffold(
        // appBar: AppBar(
        //   elevation: 0.0,
        // ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "welcome".tr(context),
                          style: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                            color: AppColor.mainColor,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    defaultTextFormField(
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "please enter email".tr(context);
                        }
                        return null;
                      },
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      prefix: Icons.email,
                      text: "email".tr(context),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                        onSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter password".tr(context);
                          }
                          return null;
                        },
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        prefix: Icons.lock,
                        text: "password".tr(context),
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixOnPressed: () {
                          LoginCubit.get(context).changePassword();
                        }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) => defaultButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            // navigateAndFinish(context, HomeLayout());
                          }
                        },
                        text: "login".tr(context),
                        width: double.infinity,
                        radius: 40,
                        color: AppColor.mainColor,
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          "create new account ?".tr(context),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        defaultTextButton(
                          function: () {
                            navigateTo(
                              context,
                              RegisterScreen(),
                            );
                          },
                          text: "register".tr(context),
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
