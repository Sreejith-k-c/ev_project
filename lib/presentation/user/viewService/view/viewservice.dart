import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../admin/view_servicecenter/controller/view_center_controller.dart';
import '../../service_center_details/view/service_center_details.dart';

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
      appBar: AppBar(
        title: Text(
          "Service centers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ViewServiceCenterController>(
        builder: (context, scontroller, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // You can adjust the cross axis count as per your requirement
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: scontroller.viewCenter.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceDetailsUser(
                      name: scontroller.viewCenter.data?[index].name ?? "",
                      id: scontroller.viewCenter.data?[index].id.toString() ?? "",
                      address: scontroller.viewCenter.data?[index].address ?? "",
                      phone: scontroller.viewCenter.data?[index].phoneNumber ?? "",
                      email: scontroller.viewCenter.data?[index].email ?? "",
                      services: scontroller.viewCenter.data?[index].servicesOffered ?? "",
                      hours:scontroller.viewCenter.data?[index].price.toString() ?? "",
                    )));
                  },
                   child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Icon(Icons.miscellaneous_services, size: 50, color: Colors.blue)),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "${scontroller.viewCenter.data?[index].name}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
