import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../core/language/app_localization/app_localization.dart';
import '../../core/language/cubit/locale_cubit.dart';
import '../../core/language/language_cache_helper/language_cache_helper.dart';
import '../../shared/ui/resources/app_colors.dart';
import '../../shared/ui/resources/app_strings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsetsDirectional.only(end:8),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.mainColor, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                      ),
                      fit: BoxFit.cover
                    ),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "mohamed nosair",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColor.greyColor),
                  ),
                  Text(
                    "+201277890731",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColor.greyColor),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundColor: AppColor.mainColor,
                  child: Icon(
                    Icons.edit,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),

            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// language
            Card(
              margin:  const EdgeInsets.only(top: 10),
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 130,
                          child: FutureBuilder(
                              future: LanguageCacheHelper()
                                  .getCachedLanguageCode(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {}
                                _value = snapshot.data == "ar" ? 1 : 2;
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: AppColor.mainColor,
                                              value: 1,
                                              groupValue: _value,
                                              onChanged: (va) {
                                                context
                                                    .read<LocaleCubit>()
                                                    .changeLanguage('ar');
                                                setState(() {
                                                  _value == va!;
                                                });
                                              }),
                                          AppText(text: "arabic"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                            activeColor: AppColor.mainColor,
                                            value: 2,
                                            groupValue: _value,
                                            onChanged: (va) {
                                              context
                                                  .read<LocaleCubit>()
                                                  .changeLanguage('en');
                                              setState(() {
                                                _value == va;
                                              });
                                            },
                                          ),
                                          AppText(text: "english"),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        );
                      });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: AppColor.mainColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(AppLocalizations.of(context)!.locale == Locale("ar")
                        ? "العربية"
                        : "English"),
                  ],
                ),
              ),
            ),
            /// support
            Card(
              child: MaterialButton(
                height: 50,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.library_books,
                      color: AppColor.mainColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: 'reports',
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: MaterialButton(
                height: 50,
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.support_agent,
                      color: AppColor.mainColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: 'Contact_support',
                    ),
                  ],
                ),
              ),
            ),

            /// log out
            Card(
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  // CacheHelper.deleteData(
                  //   key: 'token',
                  // ).then((value) {
                  //   print('uId');
                  //   context.read<AppCubit>().currentIndex = 0;
                  //   navigateAndFinish(
                  //     context,
                  //     LoginPage(),
                  //   );
                  // });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: AppColor.mainColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: 'logout',
                    ),
                  ],
                ),
              ),
            ),

            /// delete account
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: AppText(
                                    text: 'delete_account',
                                  ),
                                  content: AppText(
                                    text: 'delete_account_confirmation',
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          // MoreCubit.get(context)
                                          //     .deleteData();
                                          // navigateAndFinish(
                                          //     context, LoginPage());
                                        },
                                        child: AppText(
                                          text: 'yes',
                                          color: Colors.red,
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColor.mainColor),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: AppText(
                                          color: Colors.white,
                                          text: 'no',
                                        )),
                                  ],
                                ));
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: 'delete_account',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
