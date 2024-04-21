import 'package:ev_project/presentation/admin/Add_Deliveryboy/controller/add_deliveryboy_controller.dart';
import 'package:ev_project/presentation/admin/assign_deliveryboy/controller/assign_deliveryboy_controller.dart';
import 'package:ev_project/presentation/admin/view_deliveryboy/controller/view_deliveryboy_controller.dart';
import 'package:ev_project/presentation/admin/view_service_booking/controller/view_service_controller.dart';
import 'package:ev_project/presentation/admin/view_station_booking/controller/view_booking_controller.dart';
import 'package:ev_project/presentation/user/add_vehicle/controller/add_vehicle_controller.dart';
import 'package:ev_project/presentation/user/assigned_deliveryboy/controller/assigneed_delboy_controller.dart';
import 'package:ev_project/presentation/user/book_service_center/controller/book_service_controller.dart';
import 'package:ev_project/presentation/user/my_booking/controller/my_booking_controller.dart';
import 'package:ev_project/presentation/user/profile_details/controller/profile_controller.dart';
import 'package:ev_project/presentation/user/view_myvehicle/controller/my_vehicle_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/admin/ViewStations/controller/admin_home_controller.dart';
import 'presentation/admin/admin_add_service/controller/add_service_controller.dart';
import 'presentation/admin/admin_add_stations/controller/add_station_controller.dart';
import 'presentation/admin/view_servicecenter/controller/view_center_controller.dart';
import 'presentation/login/controller/login_controller.dart';
import 'presentation/registration/controller/registration_controller.dart';
import 'presentation/splash_screen/welcome.dart';
import 'presentation/user/station_booking_page/controller/user_station_booking_controller.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AddStationController()),
      ChangeNotifierProvider(create: (context) =>RegistrationController() ),
      ChangeNotifierProvider(create: (context) =>LoginController()),
      ChangeNotifierProvider(create: (context) =>ViewStationController()),
      ChangeNotifierProvider(create: (context) =>AddServiceController()),
      ChangeNotifierProvider(create: (context) =>ViewServiceCenterController()),
      ChangeNotifierProvider(create: (context) =>BookstationController()),
      ChangeNotifierProvider(create: (context) =>BookserviceController()),
      ChangeNotifierProvider(create: (context) =>AddDeliveryboyController()),
      ChangeNotifierProvider(create: (context) =>ProfileController()),
      ChangeNotifierProvider(create: (context) =>ViewservicebookingController()),
      ChangeNotifierProvider(create: (context) =>ViewBookingstationController()),
      ChangeNotifierProvider(create: (context) =>AssigneddelboyController()),
      ChangeNotifierProvider(create: (context) =>AssigndelboyController()),
      ChangeNotifierProvider(create: (context) =>AddVehicleController()),
      ChangeNotifierProvider(create: (context) =>MyvehicleController()),
      ChangeNotifierProvider(create: (context) =>MybookingController()),
      ChangeNotifierProvider(create: (context) =>ViewdeliveryboyController()),
    ],
   child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: welcome(),
      ),
    );
  }
}
