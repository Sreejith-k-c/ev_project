import 'package:ev_project/presentation/login/view/loginpage.dart';
import 'package:ev_project/presentation/user/assigned_deliveryboy/view/assigned_delboy.dart';
import 'package:ev_project/presentation/user/my_booking/view/my_booking.dart';
import 'package:flutter/material.dart';
import 'package:ev_project/presentation/user/profile/controller/profile_controller.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'My Profile',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      // ),
      body: Consumer<ProfileController>(
        builder: (context, pcontroller, child) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/images/prologo.jpg'),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 40),
                // Text(
                //   "${pcontroller.profileModel.data?.username}",
                //   style: TextStyle(
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 20),
                // Text(
                //   "${pcontroller.profileModel.data?.email}",
                //   style: TextStyle(
                //       fontSize: 16, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 20),
                // Text(
                //   "${pcontroller.profileModel.data?.phoneNumber}",
                //   style: TextStyle(
                //       fontSize: 16, fontWeight: FontWeight.bold),
                // ),
                SizedBox(height: 100),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AssignedDelboy()));
                      }, child: Text("Assigned delivery boy ->",
                      style: TextStyle(color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBookings()));
                      }, child: Text("View My bookings ->",
                      style: TextStyle(color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      }, child: Text("Logout",
                      style: TextStyle(color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),)),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
