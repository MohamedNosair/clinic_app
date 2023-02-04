import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/layout/cubit/cubit.dart';
import 'package:talaky_app/layout/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import 'package:talaky_app/shared/style/color.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayOutCubit, HomeLayOutStates>(
      listener: (BuildContext context, HomeLayOutStates state) {},
      builder: (BuildContext context, HomeLayOutStates state) {
        HomeLayOutCubit cubit = BlocProvider.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
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
            items: cubit.bottomItems,
          ),
          body:buildNotConnectedScreen(screen: cubit.screens[cubit.currentIndex],)


        );
      },
    );
  }
}
