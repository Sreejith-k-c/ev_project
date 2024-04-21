import 'package:ev_project/presentation/admin/view_deliveryboy/controller/view_deliveryboy_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewDeliveryboy extends StatefulWidget {
  const ViewDeliveryboy({Key? key}) : super(key: key);

  @override
  State<ViewDeliveryboy> createState() => _ViewDeliveryboyState();
}

class _ViewDeliveryboyState extends State<ViewDeliveryboy> {
  @override
  void initState() {
    Provider.of<ViewdeliveryboyController>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Delivery Boys",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ViewdeliveryboyController>(
        builder: (context, dcontroller, child) {
          return ListView.builder(
            itemCount: dcontroller.viewDeliveryboyModel.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery Boy ID: ${dcontroller.viewDeliveryboyModel.data?[index].id}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Name: ${dcontroller.viewDeliveryboyModel.data?[index].firstName}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Email: ${dcontroller.viewDeliveryboyModel.data?[index].email}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Phone: ${dcontroller.viewDeliveryboyModel.data?[index].phoneNumber}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Address: ${dcontroller.viewDeliveryboyModel.data?[index].address}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
