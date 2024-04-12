import 'package:ev_project/presentation/admin/assign_deliveryboy/controller/assign_deliveryboy_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignDeliveryboy extends StatefulWidget {
  const AssignDeliveryboy({super.key});

  @override
  State<AssignDeliveryboy> createState() => _AssignDeliveryboyState();
}

class _AssignDeliveryboyState extends State<AssignDeliveryboy> {
    final TextEditingController unameController = TextEditingController();
  final TextEditingController delboynameController = TextEditingController();
  final TextEditingController desaddressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assign Deliveryboy"),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: unameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Userame'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: delboynameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Deliveryboy name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: desaddressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Destination Address'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<AssigndelboyController>(context,listen: false).Assigndelboy(
                        context,
                        unameController.text.toString(),
                        delboynameController.text.toString(),
                        desaddressController.text.toString(),
                        phoneController.text.toString());
                    },
                    child: Text('Assign'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}