import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/core/language/app_localization/app_localization.dart';
import 'package:talaky_app/layout/cubit/cubit.dart';
import 'package:talaky_app/layout/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

import '../shared/ui/resources/app_colors.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayOutCubit, HomeLayOutStates>(
      listener: (BuildContext context, HomeLayOutStates state) {},
      builder: (BuildContext context, HomeLayOutStates state) {
        HomeLayOutCubit cubit = BlocProvider.of(context);

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: cubit.titles[cubit.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5,
            backgroundColor: AppColor.mainColor,
            selectedItemColor: Colors.white ,
            unselectedItemColor: Colors.black,
            onTap: (int index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items:   <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(
                  IconlyBroken.home,
                ),
                label: 'home'.tr(context),
              ),
              BottomNavigationBarItem(
                  icon: const Icon(IconlyBroken.bookmark),
                  label: 'bookings'.tr(context),),
              BottomNavigationBarItem(
                icon: const Icon(
                  IconlyBroken.setting,
                ),
                label: 'settings'.tr(context),
              ),
            ],
          ),
          body:buildNotConnectedScreen(screen: cubit.screens[cubit.currentIndex],)


        );
      },
    );
  }
}
