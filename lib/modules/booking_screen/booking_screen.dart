import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/modules/booking_screen/cubit/cubit.dart';
import 'package:talaky_app/shared/componants/componantes.dart';
import '../../data/models/all_booked.dart';
import '../../shared/ui/screens/not_order_screen.dart';
import 'cubit/states.dart';

class BookingScreen extends StatelessWidget {
   BookingScreen({Key? key}) : super(key: key);
  final scrollController = ScrollController();
  void setUpScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<BookedCubit>(context).loadBookeds();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setUpScrollController(context);
    BlocProvider.of<BookedCubit>(context).loadBookeds();
    return BlocBuilder<BookedCubit,BookedStates>(
      builder: (context, state){
        if (state is BookedLoadingState && state.isFirstFetch) {
          return loadingIndicator();
        }
        List<BookedData> booked = [];
        bool isLoading = false;
        if (state is BookedLoadingState) {
          booked = state.oldBooked;
          isLoading = true;
        } else if (state is BookedLoadedState) {
          booked = state.booked;
          NotOrderScreen();
        }
        return Column(
          children: [
            ListView.separated(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index < booked.length) {
                  return buildItemBooking(context, booked[index]);
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
              separatorBuilder: (context, index) => myDivider(),
              itemCount:booked.length + (isLoading ? 1 : 0),
            ),
          ],
        );
      },
    );
  }
}
Widget loadingIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(child: CircularProgressIndicator()),
  );
}

Widget buildItemBooking(BuildContext context, BookedData booked) => Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Row(
          children: [
             CircleAvatar(
              backgroundImage: NetworkImage("${booked.user!.image}"),
              backgroundColor: Colors.red,
              radius: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "${booked.user!.nameEn}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                   Text(
                    "${booked.user!.aboutEn}",
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${booked.appointmentDate}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
