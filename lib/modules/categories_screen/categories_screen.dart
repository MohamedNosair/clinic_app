import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/data/models/categories.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import '../../shared/ui/resources/app_colors.dart';
import '../center_profile_screen/center_profile_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Categories'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:  Icon(
                  IconlyBroken.arrowLeft2,
                  color: AppColor.whiteColor,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyBroken.search),
                )
              ],
            ),
            body: buildNotConnectedScreen(screen: buildCategories(context)),
          );
        });
  }

  Widget categoriesItem(Data data, context) => InkWell(
        onTap: () {
          navigateTo(context,  CenterProfileScreen(
              id:data.id,
          ),);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: NetworkImage(
                data.image,
              ),
              radius: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              data.name,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

  Widget buildCategories(context) {
    var cubit = CategoryCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: double.infinity,
        child: ConditionalBuilder(
          condition: cubit.categoriesModel?.data != null,
          builder: (context) => GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) =>
                categoriesItem(cubit.categoriesModel!.data[index], context),
            itemCount: cubit.categoriesModel!.data.length,
          ),
          fallback: (context) =>
               Center(child:progressIndicator()),
        ),
      ),
    );
  }
}
