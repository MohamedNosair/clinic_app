import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/modules/package_details_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/package_details_screen/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import 'package:talaky_app/shared/style/color.dart';

import '../../data/models/package_details_model.dart';

class PackageDetailsScreen extends StatefulWidget {
  final int id ;
  const PackageDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<PackageDetailsScreen> createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  @override
  void initState() {
    PackageDetailsCubit.get(context).getPackageDetails(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Name details package'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconlyBroken.arrowLeft2,
          ),
        ),
      ),
      body:buildNotConnectedScreen(screen: blocBuilderItem(context)) ,
    );
  }
  Widget blocBuilderItem(context){
    var cubit = PackageDetailsCubit.get(context);
    return BlocBuilder<PackageDetailsCubit, PackageDetailsStates>(
        builder:(context, state) {
          if(state is PackageDetailsSuccessState){
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// CARD PHOTO
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "${cubit.packageDetailsModel!.data!.image}",
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// NAME CENTER
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.green,
                                  backgroundImage: NetworkImage(
                                    '${cubit.packageDetailsModel!.data!.image}',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cubit.packageDetailsModel!.data!.name}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style:const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Title Center',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(IconlyBroken.location),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// NAME CERVICE
                    cubit.packageDetailsModel!.data!.packageService!.isEmpty ? const SizedBox() : Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => nameServerItem(cubit.packageDetailsModel!.data!.packageService![index]),
                              separatorBuilder: (context, index) => myDivider(),
                              itemCount: cubit.packageDetailsModel!.data!.packageService!.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /// BOOKING BOTTOM
                    Center(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: MaterialButton(
                        //   enableFeedback: true,
                        //   onPressed: () {
                        //     navigateTo(
                        //       context,
                        //       AppointmentScreen(id: cubit.packageDetailsModel!.data.id,),
                        //     );
                        //   },
                        //   child:  SmallText(text: "Make Appointment",color: Colors.white,),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } );
  }
  Widget nameServerItem(PackageDetailsService packageDetailsService) => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${packageDetailsService.name}',
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
              Text(
                '${packageDetailsService.description}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '${packageDetailsService.packagePrice}',
          ),
        ],
      );
}
