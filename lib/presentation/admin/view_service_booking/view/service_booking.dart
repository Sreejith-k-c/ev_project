import 'package:ev_project/presentation/admin/view_service_booking/controller/view_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../assign_deliveryboy/view/assign_deliveryboy.dart';

class ViewServiceBooking extends StatefulWidget {
  const ViewServiceBooking({super.key});

  @override
  State<ViewServiceBooking> createState() => _ViewServiceBookingState();
}

class _ViewServiceBookingState extends State<ViewServiceBooking> {
  @override
  void initState() {
WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
   await Provider.of<ViewservicebookingController>(context,listen: false).fetchData();


 });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Consumer<ViewservicebookingController>(builder: (context, scontroller, child) {
        return  ListView.builder(
        itemCount: scontroller.servicebookingModel.data?.length,
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
                       child: Text("${scontroller.servicebookingModel.data?[index].chargingStationName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     ),
                     Text("${scontroller.servicebookingModel.data?[index].email}"),
                     Text("${scontroller.servicebookingModel.data?[index].customBookTime}"),
                     Text("${scontroller.servicebookingModel.data?[index].time}"),
                     Text("Need deliveryboy:${scontroller.servicebookingModel.data?[index].needDeliveryBoy}"),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AssignDeliveryboy()));
                       }, child: Text("Assign delivery boy")),
                     )
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