import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/admin/ViewStations/controller/admin_home_controller.dart';
import 'presentation/admin/admin_add_stations/controller/add_station_controller.dart';
import 'presentation/login/controller/login_controller.dart';
import 'presentation/registration/controller/registration_controller.dart';
import 'presentation/splash_screen/welcome.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AddStationController()),
      ChangeNotifierProvider(create: (context) =>RegistrationController() ),
      ChangeNotifierProvider(create: (context) =>LoginController()),
      ChangeNotifierProvider(create: (context) =>ViewStationController()),
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
