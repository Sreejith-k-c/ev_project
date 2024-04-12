import 'package:flutter/material.dart';

class ServiceCenterDetails extends StatefulWidget {
  const ServiceCenterDetails({Key? key, required this.name, required this.id, required this.address, required this.phone, required this.email, required this.Services, required this.hours, });

  final String name;
  final String id;
  final String address;
  final String phone;
  final String email;
  final String Services;
  final String hours;


  @override
  State<ServiceCenterDetails> createState() => _ServiceCenterDetailsState();
}

class _ServiceCenterDetailsState extends State<ServiceCenterDetails> {
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
                  _buildRow('ID', widget.id),
                  _buildRow('Address', widget.address),
                  _buildRow('Phone Number', widget.phone),
                  _buildRow('Email', widget.email),
                  _buildRow('Services offered', widget.Services),
                  _buildRow('Operating Hours', widget.hours),
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
