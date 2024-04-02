import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ev_project/presentation/admin/ViewStations/view/ViewAllStations.dart';
import 'package:ev_project/presentation/admin/admin_add_service/view/add_service.dart';
import 'package:ev_project/presentation/admin/admin_add_stations/view/add_stations.dart';
import 'package:flutter/material.dart';

class ColorTheme {
  static Color appColor = Color.fromARGB(255, 7, 175, 119);
}

class AdminBottom extends StatefulWidget {
  const AdminBottom({Key? key}) : super(key: key);

  @override
  State<AdminBottom> createState() => _AdminBottomState();
}

class _AdminBottomState extends State<AdminBottom> {
  final _pages = [
    ViewAllStations(),
    AddStations(),
    AddService(),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(Icons.home, color: Colors.blueGrey),
          Icon(Icons.ev_station_sharp, color: Colors.blueGrey),
          Icon(Icons.miscellaneous_services_outlined, color: Colors.blueGrey),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
