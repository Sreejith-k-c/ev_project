import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../ViewStations/view/viewstations.dart';
// import '../../my_booking/view/my_booking.dart';
import '../../profile/view/profile.dart';
import '../../viewService/view/viewservice.dart';

class ColorTheme {
  static Color appColor = Color.fromARGB(255, 7, 175, 119);
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _pages = [
    ViewAllStations(),
    ViewServiceCenter(),
    // MyBookings(),
    MyProfile(),
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
          Icon(Icons.ev_station, color: Colors.blueGrey),
          Icon(Icons.miscellaneous_services, color: Colors.blueGrey),
          // Icon(Icons.bookmark_outlined, color: Colors.blueGrey),
          Icon(Icons.account_box, color: Colors.blueGrey),
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
