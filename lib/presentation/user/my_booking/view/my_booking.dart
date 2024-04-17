import 'package:ev_project/presentation/user/my_booking/controller/my_booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  void initState() {
     Provider.of<MybookingController>(context,listen: false).fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("My bookings",style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
      body:Consumer<MybookingController>(builder: (context, scontroller, child) {
        return  ListView.builder(
        itemCount: scontroller.mybookingModel.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)
              ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: 
                    Text("${scontroller.mybookingModel.data?[index].chargingStation.toString()}"),), 
                     Text("${scontroller.mybookingModel.data?[index].customBookTime}"),
                     Text("${scontroller.mybookingModel.data?[index].bookingTime}"),
                     Text("${scontroller.mybookingModel.data?[index].price}"),
                   ],
                 ),
               ),
             ),
            ),
          );
        },
      );
      },)
    );
  }
}