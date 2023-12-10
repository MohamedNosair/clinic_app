import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:talaky_app/data/models/appointment_model.dart';
import 'package:talaky_app/modules/appointment_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/appointment_screen/cubit/states.dart';
import '../../shared/componants/componantes.dart';
import '../../shared/ui/resources/app_colors.dart';

class AppointmentScreen extends StatefulWidget {
  // final int id;

  const AppointmentScreen({Key? key,
    // required this.id,
  }) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  // final int id ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        var cubit = AppointmentCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Date'),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconlyBroken.arrowLeft2),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('booking'),
            onPressed: () {
              // AppointmentCubit.get(context).postBooking(
              //     appointmentDate:, appointmentHour: , userId: ,);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColor.mainColor,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: buildNotConnectedScreen(
            screen: buildAppointmentScreen(
              context,
              cubit,
            ),
          ),
        );
      },
    );
  }

  Widget buildAppointmentScreen(context, AppointmentCubit cubit) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Choose Day',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 90,
              child: cubit.appointmentModel?.data == null
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => dayItem(
                          index, context, cubit.appointmentModel!.data![index]),
                      itemCount: cubit.appointmentModel!.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Choose Time',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            cubit.appointmentModel?.data == null
                ? const Center(child: CircularProgressIndicator())
                : gridViewBuilderTimeItem(context),
          ],
        ),
      ),
    );
  }

  Widget gridViewBuilderTimeItem(context) {
    var cubit = AppointmentCubit.get(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => timeItem(index, context, cubit.hour[index]),
      itemCount: cubit.hour.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    );
  }

  Widget dayItem(index, context, AppointmentData appointmentData) {
    AppointmentCubit cubit = AppointmentCubit.get(context);
    bool checked = index == cubit.currentIndex;
    return InkWell(
      radius: 10,
      onTap: () {
        cubit.changeColor(index);
        print("my name is index ${index.toString()}");
        setState(() {
          gridViewBuilderTimeItem(context);
        });
      },
      child: Card(
        color: checked ? Colors.green : Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('dd').format(
                    DateTime.parse(
                      appointmentData.dateCenter.toString(),
                    ),
                  ),
                  style: TextStyle(
                    color: checked ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat('MMM').format(
                      DateTime.parse(appointmentData.dateCenter.toString())),
                  style: TextStyle(
                    color: checked ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget timeItem(index, context, String hour) {
    AppointmentCubit cubit = AppointmentCubit.get(context);
    bool checked = index == cubit.currentIndexTime;
    index == cubit.currentTime;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              cubit.changeColorTime(index);
            },
            child: Card(
              color: checked ? Colors.green : Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hour.toString().toUpperCase(),
                    style: TextStyle(
                      color: checked ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
