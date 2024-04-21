import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view/service_centre_details.dart';
import '../controller/view_center_controller.dart';

class ViewServiceCenter extends StatefulWidget {
  const ViewServiceCenter({super.key});

  @override
  State<ViewServiceCenter> createState() => _ViewServiceCenterState();
}

class _ViewServiceCenterState extends State<ViewServiceCenter> {

  @override
  void initState() {
    Provider.of<ViewServiceCenterController>(context,listen: false).fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Service center",style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,),
      body:Consumer<ViewServiceCenterController>(builder: (context, scontroller, child) {
        return  ListView.builder(
        itemCount: scontroller.viewCenter.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceCenterDetails(
                  name: scontroller.viewCenter.data?[index].name ?? "",
                  id: scontroller.viewCenter.data?[index].id.toString() ?? "",
                   address: scontroller.viewCenter.data?[index].address ?? "",
                   phone: scontroller.viewCenter.data?[index].phoneNumber ?? "",
                   email: scontroller.viewCenter.data?[index].email ?? "",
                  Services: scontroller.viewCenter.data?[index].servicesOffered ?? "",
                  hours:scontroller.viewCenter.data?[index].price.toString() ?? "",)));
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)
                ),
               child: Center(child: Text("${scontroller.viewCenter.data?[index].name}")),
              ),
            ),
          );
        },
      );
      },)
    );
  }
}