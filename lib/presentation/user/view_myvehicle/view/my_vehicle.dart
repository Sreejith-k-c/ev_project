import 'package:ev_project/presentation/user/vehicle_details/view/vehicle_details.dart';
import 'package:ev_project/presentation/user/view_myvehicle/controller/my_vehicle_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyVehicle extends StatefulWidget {
  const MyVehicle({super.key});

  @override
  State<MyVehicle> createState() => _MyVehicleState();
}

class _MyVehicleState extends State<MyVehicle> {
  @override
  void initState() {
    Provider.of<MyvehicleController>(context,listen: false).fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Vehicle",style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,),
      body: Consumer<MyvehicleController>(builder: (context, mcontroller, child) {
        return ListView.builder(
          itemCount: mcontroller.myvehicleModel.data?.length,
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyvehicleDetails(
                    make:mcontroller.myvehicleModel.data?[index].make.toString()??"",
                    model: mcontroller.myvehicleModel.data?[index].model.toString()??"",
                    year: mcontroller.myvehicleModel.data?[index].year.toString()??"",
                    battery: mcontroller.myvehicleModel.data?[index].batteryCapacity.toString()??"",
                    charge: mcontroller.myvehicleModel.data?[index].chargingTime.toString()??"",)));
                },
                child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("${mcontroller.myvehicleModel.data?[index].make}")),
              ),
              ),);
          });
      },),
    );
  }
}