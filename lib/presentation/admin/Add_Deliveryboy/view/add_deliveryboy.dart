import 'package:ev_project/presentation/admin/Add_Deliveryboy/controller/add_deliveryboy_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDeliveryboy extends StatefulWidget {
  @override
  _AddDeliveryboyState createState() => _AddDeliveryboyState();
}

class _AddDeliveryboyState extends State<AddDeliveryboy> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Deliverboys'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: fnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<AddDeliveryboyController>(context,listen: false).AddDeliveryboy(
                        context,
                        fnameController.text.toString(),
                        lnameController.text.toString(),
                        phoneController.text.toString(),
                        emailController.text.toString(),
                        addressController.text.toString());
                    },
                    child: Text('Add Deliveryboy'),
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

