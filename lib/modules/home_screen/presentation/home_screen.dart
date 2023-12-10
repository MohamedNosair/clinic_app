import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:talaky_app/data/models/categories.dart';
import 'package:talaky_app/data/models/center_model.dart';
import 'package:talaky_app/data/models/offer_model.dart';
import 'package:talaky_app/data/models/package_model.dart';
import 'package:talaky_app/layout/cubit/cubit.dart';
import 'package:talaky_app/layout/cubit/states.dart';
import 'package:talaky_app/modules/categories_screen/categories_screen.dart';
import 'package:talaky_app/modules/center_screen/center_screen.dart';
import 'package:talaky_app/modules/name_offer_screen/name_offer_screen.dart';
import 'package:talaky_app/modules/offers_screen/offers_screen.dart';
import 'package:talaky_app/modules/packages_screen/packages_screen.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import '../../../shared/ui/resources/app_colors.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayOutCubit, HomeLayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayOutCubit.get(context);
        return cubit.offerModel?.data!.data == null &&
                cubit.categoriesModel?.data == null
            ? LoadingWidget()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    /// Slider
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height: 50,
                    //     child: defaultTextFormField(
                    //       onChange: (value) {},
                    //       controller: searchController,
                    //       inputType: TextInputType.name,
                    //       prefix: IconlyBroken.search,
                    //       text: 'Search',
                    //     ),
                    //   ),
                    // ),
                    cubit.offerModel?.data!.data == null
                        ?  Container()
                        : CarouselSlider(
                            options: CarouselOptions(
                              height: 200.0,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              viewportFraction: 1.0,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: cubit.offerModel!.data!.data!.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            '${item.image}',
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  '${item.image}',
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                '${item.name}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                    myDivider(),

                    /// CATEGORIES
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               Text(
                                'Categories',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColor.mainColor),
                              ),
                              const Spacer(),
                              defaultTextButton(
                                icon: IconlyBroken.arrowRight2,
                                height: 30,
                                background: AppColor.defaultSecondColor,
                                function: () {
                                  navigateTo(context, const CategoriesScreen());
                                },
                                text: 'المزيد',
                                color: AppColor.mainColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: ConditionalBuilder(
                              condition: cubit.categoriesModel?.data != null,
                              builder: (BuildContext context) =>
                                  ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, int index) =>
                                    categoriesItem(
                                        cubit.categoriesModel!.data[index]),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 1,
                                ),
                                itemCount: cubit.categoriesModel!.data.length,
                              ),
                              fallback: (BuildContext context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    myDivider(),

                    /// CENTER
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               Text(
                                'Centers',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColor.mainColor),
                              ),
                              const Spacer(),
                              defaultTextButton(
                                icon: IconlyBroken.arrowRight2,
                                height: 30,
                                background: AppColor.defaultSecondColor,
                                function: () {
                                  navigateTo(
                                    context,
                                    CenterScreen(),
                                  );
                                },
                                text: 'المزيد',
                                color: AppColor.mainColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 120,
                            child: cubit.centerModel?.data!.data == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        centersItem(
                                            context,
                                            cubit.centerModel!.data!
                                                .data![index]),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 5,
                                    ),
                                    itemCount:
                                        cubit.centerModel!.data!.data!.length,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    myDivider(),

                    /// OFFERS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               Text(
                                'Offers',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColor.mainColor),
                              ),
                              const Spacer(),
                              defaultTextButton(
                                icon: IconlyBroken.arrowRight2,
                                height: 30,
                                background: AppColor.defaultSecondColor,
                                function: () {
                                  navigateTo(context, OffersScreen());
                                },
                                text: 'المزيد',
                                color: AppColor.mainColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 120,
                            child: cubit.offerModel?.data!.data == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) => offersItem(
                                        context,
                                        cubit.offerModel!.data!.data![index]),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 5,
                                    ),
                                    itemCount:cubit.offerModel!.data!.data!.length,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    myDivider(),

                    /// PACKAGES
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               Text(
                                'Package',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColor.mainColor),
                              ),
                              const Spacer(),
                              defaultTextButton(
                                icon: IconlyBroken.arrowRight2,
                                height: 30,
                                background: AppColor.defaultSecondColor,
                                function: () {
                                  navigateTo(
                                    context,
                                    PackageScreen(),
                                  );
                                },
                                text: 'المزيد',
                                color: AppColor.mainColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: cubit.packageModel?.data!.data == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ListView.separated(
                                    itemBuilder: (context, index) =>
                                        packagesItem(
                                            context,
                                            cubit.packageModel!.data!
                                                .data![index]),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        cubit.packageModel!.data!.data!.length,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    myDivider(),
                  ],
                ),
              );
      },
    );
  }

  Widget categoriesItem(Data data) => SizedBox(
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                data.image,
              ),
              backgroundColor: Colors.grey[100],
              radius: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );

  Widget centersItem(context, CenterData data) => Column(
        children: [
          Card(
            shadowColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Container(
              width: 140,
              height: 70,
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
      );

  Widget offersItem(context, OfferData data) => InkWell(
        onTap: () {
          navigateTo(
              context,
              NameOfferScreen(
                id: data.id!,
              ));
        },
        child: Card(
          shadowColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data.name} ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      data.discountType == '0'
                          ? Text(
                              '${data.discount} EG',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          : Text(
                              '${data.discount} %',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                      Text(
                        DateFormat('dd MMMM')
                            .format(DateTime.parse(data.startAt.toString())),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        DateFormat('dd MMMM')
                            .format(DateTime.parse(data.endAt.toString())),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10),
                    bottomEnd: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${data.image}',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget packagesItem(context, PackageData data) => Card(
        shadowColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 40,
                backgroundImage: NetworkImage(
                  '${data.user!.logo}',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${data.name}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' ${data.price}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
