import 'dart:io';
import 'package:ev_project/presentation/user/add_vehicle/controller/add_vehicle_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../global_widget/image_icon_butto.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
File? image;
var makeController=TextEditingController();
var modelController=TextEditingController();
var yearController=TextEditingController();
var batteryController=TextEditingController();
var chargingtimeController=TextEditingController();

Future<void> _getImage(ImageSource source) async{
  final PickedFile=await ImagePicker().pickImage(source: source);
  if(PickedFile !=null) {
    setState(() {
      image=File(PickedFile.path);
    });
  }
}

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var width=size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add Vehicle',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: makeController,
                decoration: InputDecoration(
                  labelText: 'Brand Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: modelController,
                decoration: InputDecoration(
                  labelText: 'Model Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: yearController,
                decoration: InputDecoration(
                  labelText: 'Year',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: batteryController,
                decoration: InputDecoration(
                  labelText: 'Battery Capacity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: chargingtimeController,
                decoration: InputDecoration(
                  labelText: 'Charging Time',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImageIconButton(
                      width: width * .35,
                      height: size.height * .06,
                      onPressed: () => _getImage(ImageSource.camera),
                      icon: Icons.camera_alt_outlined,
                      label: 'Camera',
                    ),
                    ImageIconButton(
                      width: width * .35,
                      height: size.height * .06,
                      onPressed: () => _getImage(ImageSource.gallery),
                      icon: Icons.photo,
                      label: 'Gallery',
                    ),
                  ],
                ),
                if (image != null)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    width: 200,
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
              SizedBox(height: 16),

              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AddVehicleController>(context,listen: false).addVehicle(
                      context,
                      image,
                      makeController.text,
                      modelController.text,
                      yearController.text,
                      batteryController.text,
                      chargingtimeController.text);
                  },
                  child: Text('Add Vehicle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}