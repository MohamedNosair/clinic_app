import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:talaky_app/data/models/center_details.dart';
import 'package:talaky_app/modules/appointment_screen/appointment_screen.dart';
import 'package:talaky_app/modules/center_profile_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/center_profile_screen/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';

import '../../shared/ui/resources/app_colors.dart';

class CenterProfileScreen extends StatefulWidget {
  final int id;

  const CenterProfileScreen({Key? key,
    required this.id
  }) : super(key: key);

  @override
  State<CenterProfileScreen> createState() => _CenterProfileScreenState();
}

class _CenterProfileScreenState extends State<CenterProfileScreen> {
  @override
  void initState() {
    CenterProfileCubit.get(context).getCenterProfile(
        id: widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(
            IconlyBroken.arrowLeft2,
            color: AppColor.whiteColor,
          ),
        ),
        title: const Text('الصفحة الشخصية'),
      ),
      body: buildNotConnectedScreen(screen: blocBuilderItem(context)),
    );
  }

  Widget blocBuilderItem(BuildContext context) {
    return BlocBuilder<CenterProfileCubit, CenterProfileStates>(
      builder: (context, state) {
        var cubit = CenterProfileCubit.get(context);
        if (state is CenterProfileSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: AppColor.mainColor,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${cubit.centerDetailsModel!.data.image}"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${cubit.centerDetailsModel!.data.name}",
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "${cubit.centerDetailsModel!.data.address}",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[100],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Star'),
                                        ],
                                      ),
                                    ),
                                    // const Spacer(),
                                    // IconButton(
                                    //   onPressed: () {
                                    //     CenterProfileCubit.get(context)
                                    //         .onLike();
                                    //   },
                                    //   icon: Icon(
                                    //     IconlyBold.heart,
                                    //     color: CenterProfileCubit.get(context)
                                    //         .like
                                    //         ? Colors.red
                                    //         : Colors.white,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        'Bio',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColor.mainColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${cubit.centerDetailsModel!.data.about}",
                        maxLines: 5,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// CATEGORIES
                  cubit.centerDetailsModel!.data.category!.isEmpty
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              'Categories',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColor.mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => categoriesItem(
                                    cubit.centerDetailsModel!.data
                                        .category![index]),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemCount: cubit
                                    .centerDetailsModel!.data.category!.length,
                              ),
                            ),
                          ],
                        ),

                  /// OFFERS
                  cubit.centerDetailsModel!.data.offer!.isEmpty
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                Text(
                                  'Offers',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColor.mainColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => offersItem(
                                    context,
                                    cubit.centerDetailsModel!.data
                                        .offer![index]),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 5,
                                ),
                                itemCount: cubit
                                    .centerDetailsModel!.data.offer!.length,
                              ),
                            ),
                          ],
                        ),

                  /// PACKAGE
                  const SizedBox(
                    height: 10,
                  ),
                  cubit.centerDetailsModel!.data.package!.isEmpty
                      ? const SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                Text(
                                  'Package',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColor.mainColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => packagesItem(
                                    context,
                                    cubit.centerDetailsModel!.data
                                        .package![index]),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 5,
                                ),
                                itemCount: cubit
                                    .centerDetailsModel!.data.package!.length,
                              ),
                            ),
                          ],
                        ),

                  /// BUTTON MAKE APPOINTMENT
                  const SizedBox(
                    height: 10,
                  ),
                  defaultButton(
                    onPressed: () {
                      navigateTo(
                          context,
                          AppointmentScreen(
                            // id: cubit.centerDetailsModel!.data.id,
                          ),
                        // AppointmentPage(),
                      );
                    },
                    text: 'Make Appointment',
                    width: double.infinity,
                    radius: 10,
                    color: AppColor.mainColor,
                  ),
                ],
              ),
            ),
          );
        } else {
          return  Center(
            child: progressIndicator(),
          );
        }
      },
    );
  }

  Widget categoriesItem(CenterDetailsCategory centerDetailsCategory) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            radius: 30,
            child: const Image(
              image: NetworkImage(
                'https://png.pngtree.com/element_our/20190604/ourlarge/pngtree-one-earphone-image_1476137.jpg',
              ),
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${centerDetailsCategory.name}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );

  Widget packagesItem(context, CenterDetailsPackage centerDetailsPackage) =>
      Card(
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
                backgroundImage: NetworkImage(
                  "${centerDetailsPackage.image}",
                ),
                radius: 40,
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
                      "${centerDetailsPackage.name}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      ' 85 EGP',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
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

  Widget offersItem(context, CenterDetailsOffer centerDetailsOffer) => InkWell(
        onTap: () {},
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
                      const Text(
                        'mohamed ali ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      centerDetailsOffer.discountType == '0'
                          ? Text(
                              '${centerDetailsOffer.discount} EG',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          : Text(
                              '${centerDetailsOffer.discount} %',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                      Text(
                        DateFormat('dd MMMM').format(DateTime.parse(
                            centerDetailsOffer.startAt.toString())),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        DateFormat('dd MMMM').format(DateTime.parse(
                            centerDetailsOffer.endAt.toString())),
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
                      "${centerDetailsOffer.image}",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
