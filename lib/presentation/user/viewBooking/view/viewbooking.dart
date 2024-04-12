import 'package:flutter/material.dart';

class ViewBooking extends StatefulWidget {
  const ViewBooking({super.key});

  @override
  State<ViewBooking> createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My booking",style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,),
      
    );
  }
}