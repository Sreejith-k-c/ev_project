import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/add_service_controller.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
var serviceController=TextEditingController();
var nameController=TextEditingController();
var addressController=TextEditingController();
var addressCotroller=TextEditingController();
var phoneController=TextEditingController();
var emailController=TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add Service center',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: serviceController,
                decoration: InputDecoration(
                  labelText: 'Services offered',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AddServiceController>(context,listen: false).addServices(
                      context,
                      serviceController.text.trim(),
                      nameController.text.trim(),
                      addressController.text.trim(),
                      phoneController.text.trim(),
                      emailController.text.trim());
                  },
                  child: Text('Add Service center'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}