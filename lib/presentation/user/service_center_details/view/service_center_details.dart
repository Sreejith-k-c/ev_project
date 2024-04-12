import 'package:flutter/material.dart';

import '../../book_service_center/view/book_service_view.dart';

class ServiceDetailsUser extends StatefulWidget {
   const ServiceDetailsUser({super.key, required this.name, required this.id, required this.address, required this.phone, required this.email, required this.services, required this.hours, });

  final String name;
  final String id;
  final String address;
  final String phone;
  final String email;
  final String services;
  final String hours;


  @override
  State<ServiceDetailsUser> createState() => _ServiceDetailsUserState();
}

class _ServiceDetailsUserState extends State<ServiceDetailsUser> {
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
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow('ID', widget.id),
                  _buildRow('Address', widget.address),
                  _buildRow('Phone Number', widget.phone),
                  _buildRow('Email', widget.email),
                  _buildRow('Services offered', widget.services),
                  _buildRow('Operating Hours', widget.hours),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookService()));
              }, child: Text("Book Service")),
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
