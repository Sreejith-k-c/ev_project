import 'package:ev_project/app_config/app_config.dart';
import 'package:flutter/material.dart';

class MyvehicleDetails extends StatefulWidget {
  const MyvehicleDetails({super.key, this.image, required this.make, required this.model, required this.year, required this.battery, required this.charge});

  final String? image;
  final String make;
  final String model;
  final String year;
  final String battery;
  final String charge;

  @override
  State<MyvehicleDetails> createState() => _MyvehicleDetailsState();
}

class _MyvehicleDetailsState extends State<MyvehicleDetails> {
  @override
  Widget build(BuildContext context) {
    var imageUrl=widget.image==null?"https://t4.ftcdn.net/jpg/00/89/55/15/240_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg":AppConfig.mediaurl+widget.image.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model),
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
                  _buildRow('Brand', widget.make),
                  _buildRow('Model', widget.model),
                  _buildRow('Year', widget.year),
                  _buildRow('Battery Capacity', widget.battery),
                  _buildRow('Charging Time', widget.charge),
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