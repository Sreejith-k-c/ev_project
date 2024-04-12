import 'package:ev_project/presentation/admin/view_station_booking/controller/view_booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewStationBooking extends StatefulWidget {
  const ViewStationBooking({super.key});

  @override
  State<ViewStationBooking> createState() => _ViewStationBookingState();
}

class _ViewStationBookingState extends State<ViewStationBooking> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    await Provider.of<ViewBookingstationController>(context,listen: false).fetchData();


     });
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<ViewBookingstationController>(builder: (context, scontroller, child) {
        return  ListView.builder(
        itemCount: scontroller.stationbookingModel.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 210,
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
                       child: Text("${scontroller.stationbookingModel.data?[index].userDetails?.username??""}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     ),
                     Text("${scontroller.stationbookingModel.data?[index].userDetails?.username?? ""}"),
                     Text("${scontroller.stationbookingModel.data?[index].userDetails?.email}"),
                     Text("${scontroller.stationbookingModel.data?[index].time}"),
                     Text("${scontroller.stationbookingModel.data?[index].customBookTime}"),
                     Text("${scontroller.stationbookingModel.data?[index].time}"),
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