import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../global_widget/image_icon_butto.dart';
import '../controller/add_station_controller.dart';

class AddStations extends StatefulWidget {
  const AddStations({super.key});

  @override
  State<AddStations> createState() => _AddStationsState();
}

class _AddStationsState extends State<AddStations> {
File? image;
var stationnameController=TextEditingController();
var latitudeCotroller=TextEditingController();
var longitudeCotroller=TextEditingController();
var addressCotroller=TextEditingController();
var operatinghoursCotroller=TextEditingController();
var contactCotroller=TextEditingController();
var priceCotroller=TextEditingController();

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
                  'Add Station',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: stationnameController,
                decoration: InputDecoration(
                  labelText: 'Station Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: latitudeCotroller,
                decoration: InputDecoration(
                  labelText: 'Latitude',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: longitudeCotroller,
                decoration: InputDecoration(
                  labelText: 'Longitude',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: addressCotroller,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: operatinghoursCotroller,
                decoration: InputDecoration(
                  labelText: 'Operating hours',
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
              TextFormField(
                controller: contactCotroller,
                decoration: InputDecoration(
                  labelText: 'Contact info',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
                          SizedBox(height: 16),
              TextFormField(
                controller: priceCotroller,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AddStationController>(context,listen: false).addStation(
                      context, image,
                      stationnameController.text,
                      latitudeCotroller.text,
                      longitudeCotroller.text,
                      addressCotroller.text,
                      operatinghoursCotroller.text,
                      contactCotroller.text,
                      priceCotroller.text);

                      stationnameController.clear();
                      latitudeCotroller.clear();
                      longitudeCotroller.clear();
                      addressCotroller.clear();
                      operatinghoursCotroller.clear();
                      contactCotroller.clear();
                      priceCotroller.clear();
                  },
                  child: Text('Add Station'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}