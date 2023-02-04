import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/data/models/city_model.dart';
import 'package:talaky_app/layout/home_layout.dart';
import 'package:talaky_app/modules/city_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/city_screen/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

class CityScreen extends StatelessWidget {
  const CityScreen(int id, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityCubit, CityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CityCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('City'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconlyBroken.arrowLeft2),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyBroken.search),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ConditionalBuilder(
                  condition: cubit.cityModel?.data != null,
                  builder: (context) => GridView.builder(
                    shrinkWrap: true ,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1 ,
                      mainAxisExtent: 100,
                    ),
                    itemBuilder: (context , index ) => cityItem(context , cubit.cityModel!.data[index]),
                    itemCount: cubit.cityModel!.data.length ,
                  ),
                  fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
                ),
              ),
            ) ,
          );
        });
  }
  Widget cityItem(context , DataCity data) => InkWell(
    onTap: ()
    {
      navigateAndFinish(context, HomeLayout());
    },
    child: Card(
      color: Colors.white,
      elevation: 3,
      child: Row(
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/f/f2/Governadorat_de_Daqahliya.png',
              ),
              radius: 25,
            ),
          ),
          Text(
            '${data.name}',
            maxLines: 1 ,
            overflow: TextOverflow.ellipsis,
            softWrap:   true,
          ),
        ],
      ),
    ),
  );
}
