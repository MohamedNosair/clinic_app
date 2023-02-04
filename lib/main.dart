import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talaky_app/data/repositories/center_repository.dart';
import 'package:talaky_app/data/repositories/offer_repository.dart';
import 'package:talaky_app/data/repositories/package_repository.dart';
import 'package:talaky_app/data/services/center_service.dart';
import 'package:talaky_app/data/services/offer_service.dart';
import 'package:talaky_app/data/services/package_service.dart';
import 'package:talaky_app/layout/cubit/cubit.dart';
import 'package:talaky_app/layout/home_layout.dart';
import 'package:talaky_app/modules/activities_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/appointment_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/center_profile_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/center_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/city_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/country_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/login_screen/login_screen.dart';
import 'package:talaky_app/modules/name_offer_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/offers_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/on_boarding_screen/on_boarding_screen.dart';
import 'package:talaky_app/modules/package_details_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/packages_screen/cubit/cubit.dart';
import 'package:talaky_app/modules/register_screen/cubit/cubit.dart';
import 'package:talaky_app/shared/componants/constants.dart';
import 'package:talaky_app/shared/network/local/cachehelper/cache_helper.dart';
import 'package:talaky_app/shared/network/remote/dio_helper.dart';
import 'package:talaky_app/shared/style/themes.dart';
import 'data/repositories/all_booked_repository.dart';
import 'data/services/all_booked_services.dart';
import 'modules/booking_screen/cubit/cubit.dart';
import 'modules/categories_screen/cubit/cubit.dart';
import 'modules/login_screen/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: "onBoarding");
  token = CacheHelper.getData(key: "token");

  if (onBoarding != null) {
    if (token != null) {
      widget = HomeLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
    repository: PackageRepository(PackageService()),
    offerRepository: OfferRepository(OfferService()),
    centerRepository: CenterRepository(CenterService()),
    bookedRepository: BookedRepository(BookedService()),
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final PackageRepository repository;
  final OfferRepository offerRepository;
  final CenterRepository centerRepository;
  final BookedRepository bookedRepository;

  const MyApp({
    Key? key,
    required this.startWidget,
    required this.repository,
    required this.offerRepository,
    required this.centerRepository,
    required this.bookedRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// register
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),

        /// login
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),

        /// Appointment
        BlocProvider(
          create: (BuildContext context) =>
              AppointmentCubit()..getAppointment(),
        ),

        /// Home
        BlocProvider(
          create: (BuildContext context) => HomeLayOutCubit()
            ..getCategories()
            ..postCenters()
            ..postOffer()
            ..postPackage(),
        ),

        /// CenterProfile
        BlocProvider(
          create: (BuildContext context) => CenterProfileCubit(),
        ),

        /// Activities
        BlocProvider(
          create: (BuildContext context) => ActivitiesCubit()..getActivities(),
        ),

        /// CategoryScreen
        BlocProvider(
          create: (BuildContext context) => CategoryCubit()..getCategories(),
        ),

        /// CenterScreen
        BlocProvider(
          create: (BuildContext context) => CenterCubit(centerRepository),
        ),

        /// BookedScreen
        BlocProvider(
          create: (BuildContext context) => BookedCubit(bookedRepository),
        ),

        /// OfferScreen
        BlocProvider(
          create: (BuildContext context) => OfferCubit(offerRepository),
        ),

        /// countryScreen
        BlocProvider(
          create: (BuildContext context) => CountryCubit()..getCountry(),
        ),

        /// cityScreen
        BlocProvider(
          create: (BuildContext context) => CityCubit()..getCity(),
        ),

        /// packageScreen
        BlocProvider(
          create: (BuildContext context) =>
              PackageCubit(repository)..loadPackages(),
        ),

        /// CenterProfile
        BlocProvider(
          create: (BuildContext context) => CenterProfileCubit(),
        ),

        ///OfferDetails
        BlocProvider(
          create: (BuildContext context) => OfferDetailsCubit(),
        ),

        ///PackageDetails
        BlocProvider(
          create: (BuildContext context) => PackageDetailsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: startWidget,
      ),
    );
  }
}
