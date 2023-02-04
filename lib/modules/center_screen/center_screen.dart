import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/data/models/center_model.dart';
import 'package:talaky_app/modules/center_profile_screen/center_profile_screen.dart';
import 'package:talaky_app/modules/center_profile_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/center_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/center_screen/cubit/states.dart';
import 'package:talaky_app/modules/search_center_screen/search_center_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

class CenterScreen extends StatelessWidget {
  CenterScreen({Key? key}) : super(key: key);
  final scrollController = ScrollController();
  void setUpScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<CenterCubit>(context).loadCenters();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setUpScrollController(context);
    BlocProvider.of<CenterCubit>(context).loadCenters();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centers'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyBroken.arrowLeft2),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, SearchCenterScreen());
            },
            icon: const Icon(IconlyBroken.search),
          )
        ],
      ),
      body:buildNotConnectedScreen(screen: centerBuild(context)) ,
    );
  }

  Widget centerBuild(context) {
    return BlocBuilder<CenterCubit, CenterStates>(
      builder: (context, state) {
        if (state is CenterLoadingState && state.isFirstFetch) {
          return loadingIndicator();
        }
        List<CenterData> center = [];
        bool isLoading = false;
        if (state is CenterLoadingState) {
          center = state.oldCenter;
          isLoading = true;
        } else if (state is CenterLoadedState) {
          center = state.center;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: GridView.builder(
              controller: scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 ,
                crossAxisSpacing: 4,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                if (index < center.length) {
                  return centersItem(context, center[index]);
                }
                else {
                  Timer(
                    const Duration(milliseconds: 30),
                    () {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    },
                  );
                  return loadingIndicator();
                }
              },
              itemCount: center.length + (isLoading ? 1 : 0),

            ),
          ),
        );
      },
    );
  }

  Widget loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
  Widget centersItem(context, CenterData data) => InkWell(
        onTap: () {
          navigateTo(context,   CenterProfileScreen(id: data.id??0,));
          // CenterProfileCubit.get(context).getCenterProfile(id:data.id??0);
        },
        child: Column(
          children: [
            Card(
              shadowColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      '${data.logo}',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${data.name}',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
