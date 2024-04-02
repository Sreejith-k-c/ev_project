import 'package:flutter/material.dart';

class StationDetals extends StatefulWidget {
  const StationDetals({Key? key}) : super(key: key);

  @override
  State<StationDetals> createState() => _StationDetalsState();
}

class _StationDetalsState extends State<StationDetals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name"),
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
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    'Image',
                    style: TextStyle(
                 fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow('UID', 'Enter UID'),
                  _buildRow('Name', 'Enter Name'),
                  _buildRow('Latitude', 'Enter Latitude'),
                  _buildRow('Longitude', 'Enter Longitude'),
                  _buildRow('Address', 'Enter Address'),
                  _buildRow('Operating Hours', 'Enter Operating Hours'),
                  _buildRow('Contact Info', 'Enter Contact Info'),
                  _buildRow('Operational Status', 'Enter Operational Status'),
                  _buildRow('Price', 'Enter Price'),
                  _buildRow('Booked Status', 'Enter Booked Status'),
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
