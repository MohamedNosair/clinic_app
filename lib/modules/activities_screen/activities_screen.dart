import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/data/models/activities_model.dart';
import 'package:talaky_app/layout/home_layout.dart';
import 'package:talaky_app/modules/activities_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/activities_screen/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivitiesCubit, ActivitiesStates>(
      listener: (context, state) {
        if (state is ActivitiesSuccessState) {
          
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Activities',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: ActivitiesCubit.get(context).activitiesModel == null
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 10.0),
                            itemBuilder: (context, index) => buildItem(
                                ActivitiesCubit.get(context)
                                    .activitiesModel!
                                    .data[index],
                                context),
                            itemCount: 1,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(DataModel data, context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              navigateTo(context, HomeLayout());
            },
            child: SizedBox(
              width: 150,
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.redAccent,
                            height: 3,
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image(
                      image: NetworkImage(
                        data.image,
                      ),
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                    const Spacer(),
                    Text(
                      data.name,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconlyLight.plus,
                    color: Colors.grey.withOpacity(.4),
                    size: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
