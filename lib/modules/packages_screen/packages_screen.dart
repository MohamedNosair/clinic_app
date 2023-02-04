import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/data/models/package_model.dart';
import 'package:talaky_app/modules/package_details_screen/package_details_screen.dart';
import 'package:talaky_app/modules/packages_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/packages_screen/cubit/states.dart';
import 'package:talaky_app/modules/search_package_screen/search_package_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

class PackageScreen extends StatelessWidget {
  PackageScreen({Key? key}) : super(key: key);
  final scrollController = ScrollController();
  void setUpScrollController(context)
  {
    scrollController.addListener(() {
      if(scrollController.position.atEdge)
      {
        if(scrollController.position.pixels != 0 )
        {
          BlocProvider.of<PackageCubit>(context).loadPackages();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    setUpScrollController(context);
    BlocProvider.of<PackageCubit>(context).loadPackages();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyBroken.arrowLeft2),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, SearchPackageScreen());
            },
            icon: const Icon(IconlyBroken.search),
          )
        ],
      ),
      body: buildNotConnectedScreen(screen: packageBuild(context)),
    );
  }

  Widget packageBuild(context) {
    return BlocBuilder<PackageCubit, PackageStates>(
      builder: (context, state) {
        if (state is PackageLoadingState && state.isFirstFetch) {
          return loadingIndicator();
        }
        List<PackageData> package = [];
        bool isLoading = false ;
        if (state is PackageLoadingState) {
          print('state loading called');
          package = state.oldPackage;
          isLoading = true ;
        } else if (state is PackageLoadedState) {
          print('state loaded called');
          package = state.package;
        }
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if(index < package.length) {
              return dealsItem(package[index], context);
            }else {
              Timer(const Duration(milliseconds: 30), ()
              {
                scrollController.jumpTo(
                    scrollController.position.maxScrollExtent
                );
              });

              return loadingIndicator();
            }

          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black12,
            );
          },
          itemCount: package.length + (isLoading ? 1 : 0),
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

  Widget dealsItem(PackageData data, BuildContext context) => InkWell(
    onTap: (){
      navigateTo(context,PackageDetailsScreen(id:data.id!));
      // print("package ")
    },
    child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: Stack(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${data.image}',
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    '${data.user!.image}',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  '${data.user!.name}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${data.price} EG',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  'From ${data.user!.name}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  'To 30 May',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
  );
}
