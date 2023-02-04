import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:talaky_app/data/models/offer_details.dart';
import 'package:talaky_app/modules/appointment_screen/appointment_screen.dart';
import 'package:talaky_app/modules/name_offer_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/name_offer_screen/cubit/states.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import 'package:talaky_app/shared/style/color.dart';
import 'package:talaky_app/widgets/small_text.dart';

class NameOfferScreen extends StatefulWidget {
  final int id ;
  const NameOfferScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<NameOfferScreen> createState() => _NameOfferScreenState();
}

class _NameOfferScreenState extends State<NameOfferScreen> {
  @override
  void initState() {
    OfferDetailsCubit.get(context).getOfferDetails(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = OfferDetailsCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Offer'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconlyBroken.arrowLeft2,
          ),
        ),
      ),
      body: BlocBuilder<OfferDetailsCubit, OfferDetailsStates>(
          builder:(context, state) {
        if(state is OfferDetailsSuccessState){
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
                            "${cubit.offerDetailsModel!.data.image}",
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
                                  '${cubit.offerDetailsModel!.data.image}',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cubit.offerDetailsModel!.data.name}',
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
                  cubit.offerDetailsModel!.data.offerService!.isEmpty ? const SizedBox() :Card(
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
                            itemBuilder: (context, index) => nameServerItem(cubit.offerDetailsModel!.data.offerService![index]),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: cubit.offerDetailsModel!.data.offerService!.length,
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
                      child: MaterialButton(
                        enableFeedback: true,
                        onPressed: () {
                          navigateTo(
                            context,
                             AppointmentScreen(id: cubit.offerDetailsModel!.data.id!.toInt()),
                          );
                        },
                        child:  SmallText(text: "Make Appointment",color: Colors.white,),
                      ),
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
      } ),
    );
  }
   // Widget offersItem(context) => Card(
  Widget nameServerItem(OfferDetailsService offerDetailsService) => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${offerDetailsService.name}',
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
                '${offerDetailsService.description}',
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
            '${offerDetailsService.offerPrice}',
          ),
        ],
      );
}
