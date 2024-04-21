import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/assigneed_delboy_controller.dart';

class AssignedDelboy extends StatefulWidget {
  const AssignedDelboy({super.key});

  @override
  State<AssignedDelboy> createState() => _AssignedDelboyState();
}

class _AssignedDelboyState extends State<AssignedDelboy> {
  @override
  void initState() {
    Provider.of<AssigneddelboyController>(context,listen: false).fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assigned Deliveryboy",style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,),
      body:Consumer<AssigneddelboyController>(builder: (context, scontroller, child) {
        return  ListView.builder(
        itemCount: scontroller.assignedDeliveryboyModel.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                       child: Text("${scontroller.assignedDeliveryboyModel.data?[index].deliveryboyName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     ),
                     Text("${scontroller.assignedDeliveryboyModel.data?[index].phoneNumber}"),
                     Text("${scontroller.assignedDeliveryboyModel.data?[index].username}"),
                     Text("${scontroller.assignedDeliveryboyModel.data?[index].destinationAddress}"),
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