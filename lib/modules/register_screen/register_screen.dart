import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/core/language/app_localization/app_localization.dart';
import 'package:talaky_app/modules/country_screen/country_screen.dart';
import 'package:talaky_app/modules/register_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/register_screen/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import '../../shared/componants/constants.dart';
import '../../shared/network/local/cachehelper/cache_helper.dart';
import '../../shared/ui/resources/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CacheHelper.saveData(
            key: 'token',
            value: state.registerModel.token,
          ).then((value) {
            token = state.registerModel.token!;
            // print("my name is token $token");
            navigateAndFinish(context, const CountryScreen());
          });
        } else {
          // print("my name is no token ");
        }
      },
      builder: (context, state) =>
          Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconlyBroken.arrowLeft2),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children:  [
                          Text(
                            "welcome".tr(context),
                            style: const TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '.',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                       Text(
                        "please create an account to continue ".tr(context),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      defaultTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter name".tr(context);
                          }
                          return null ;
                        },
                        controller: nameController,
                        inputType: TextInputType.name,
                        prefix: Icons.account_circle,
                        text:  "full name".tr(context),
                        onSubmitted: (value) {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter phone".tr(context);
                          }
                          return null;
                        },
                        controller: phoneController,
                        inputType: TextInputType.phone,
                        prefix: Icons.call,
                        text:  "phone number ".tr(context),
                        onSubmitted: (value) {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
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
                        text: "email".tr(context) ,
                        onSubmitted: (value) {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                          onSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                name: nameController.text,
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
                          text: 'password'.tr(context),
                          suffix: RegisterCubit
                              .get(context)
                              .suffix,
                          isPassword: RegisterCubit
                              .get(context)
                              .isPassword,
                          suffixOnPressed: () {
                            RegisterCubit.get(context).changePassword();
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) =>
                            defaultButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                    name: nameController.text,
                                  );
                                  navigateTo(context, const CountryScreen());
                                }
                              },
                              text: "register".tr(context),
                              width: double.infinity,
                              radius: 40, color: AppColor.mainColor,
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
