import 'package:ev_project/presentation/login/view/loginpage.dart';
import 'package:ev_project/presentation/user/add_vehicle/view/add_vehicle.dart';
import 'package:ev_project/presentation/user/profile_details/view/profile_details.dart';
import 'package:flutter/material.dart';
import '../../../../global_widget/card_widget.dart';
import '../../assigned_deliveryboy/view/assigned_delboy.dart';
import '../../my_booking/view/my_booking.dart';
import '../../view_myvehicle/view/my_vehicle.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final pages = [
    ProfileDetails(),
    const AddVehicle(),
    const MyVehicle(),
    MyBookings(),
    AssignedDelboy(),
  ];
  var iconName = [
    "profile",
    "Add Vehicle",
    "My Vehicle",
    "My Booking",
    "Assigned Deliveryboy"
  ];
  static const icons = <IconData>[
    Icons.person,
    Icons.no_crash_sharp,
    Icons.car_rental,
    Icons.book,
    Icons.delivery_dining,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 60.0,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: iconName.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CardWidget(
                            iconName: iconName[index],
                            icons: icons[index],
                            pageName: pages[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => pages[index],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text("Logout")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
