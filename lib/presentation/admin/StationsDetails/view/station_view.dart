import 'package:ev_project/app_config/app_config.dart';
import 'package:flutter/material.dart';

class StationDetals extends StatefulWidget {
  const StationDetals({Key? key, required this.uid, required this.name, required this.latitude, required this.longitude, required this.address, required this.operatingHours, required this.contact, required this.price, required this.status, required this.photo}) : super(key: key);

  final String? photo;
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
  State<StationDetals> createState() => _StationDetalsState();
}

class _StationDetalsState extends State<StationDetals> {
 
  @override
  Widget build(BuildContext context) {
     var imageUrl=widget.photo==null?"https://t4.ftcdn.net/jpg/00/89/55/15/240_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg":AppConfig.mediaurl+widget.photo.toString();
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
                  image: DecorationImage(image: NetworkImage(imageUrl))
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
                  SizedBox(height: 20),
                ],
              ),
            ),
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
