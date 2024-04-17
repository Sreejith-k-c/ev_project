import 'package:ev_project/app_config/app_config.dart';
import 'package:flutter/material.dart';

import '../../station_booking_page/view/user_station_booking_view.dart';

class UserStationDetals extends StatefulWidget {
  const UserStationDetals({Key? key, required this.uid, required this.name, required this.latitude, required this.longitude, required this.address, required this.operatingHours, required this.contact, required this.price, required this.status, required this.photo}) : super(key: key);

  final String photo;
  final String uid;
  final String name;
  final String latitude;
  final String longitude;
  final String address;
  final String operatingHours;
  final String contact;
  final String price;
  final String status;

  @override
  State<UserStationDetals> createState() => _UserStationDetalsState();
}

class _UserStationDetalsState extends State<UserStationDetals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(AppConfig.mediaurl+widget.photo))
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow('UID', widget.uid),
                  _buildRow('Name', widget.name),
                  _buildRow('Latitude', widget.latitude),
                  _buildRow('Longitude', widget.longitude),
                  _buildRow('Address', widget.address),
                  _buildRow('Operating Hours', widget.operatingHours),
                  _buildRow('Contact Info', widget.contact),
                  _buildRow('Price', widget.price),
                  _buildRow('Booked Status', widget.status),
                  SizedBox(height: 10),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>BookStation(
            //     uid:widget.uid, price: widget.price,
            //     )));
            //             }, child: Text("Book Station")),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingPage(
                uid:widget.uid,
                price: widget.price,)));
                        }, child: Text("Book")),
            )
          ],
        ),
      ),

    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(value),
            ),
          ),
          
        ],
        
      ),
    );
    
  }
  
}
