import 'package:ev_project/presentation/user/BottomNavigation/view/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_project/presentation/user/book_station/controller/book_station_controller.dart';

class BookStation extends StatefulWidget {
  BookStation({Key? key, required this.uid});
  final String uid;

  @override
  State<BookStation> createState() => _BookStationState();
}

class _BookStationState extends State<BookStation> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController customBookTimeController =
      TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)), // Adjust as needed
    );
    if (pickedDate != null) {
      setState(() {
        // Format the picked date as yyyy-mm-dd
        dateController.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        // Format the picked time as hour:minute
        customBookTimeController.text =
            "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Charging Station'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date',
                  ),
                  onTap: () => _selectDate(context),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: customBookTimeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                  ),
                  onTap: () => _selectTime(context),
                  readOnly: true,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<BookstationController>(context, listen: false)
                        .BookStation(
                      context,
                      widget.uid,
                      emailController.text.toString(),
                      dateController.text.toString(),
                      customBookTimeController.text.toString(),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
