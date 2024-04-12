import 'package:ev_project/presentation/user/BottomNavigation/view/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ev_project/presentation/user/book_service_center/controller/book_service_controller.dart';

class BookService extends StatefulWidget {
  const BookService({Key? key});

  @override
  State<BookService> createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController stationnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController delboyController = TextEditingController();

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
        timeController.text =
            "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Service center'),
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
                  controller: stationnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Station Name',
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
                  controller: timeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                  ),
                  onTap: () => _selectTime(context),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: delboyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Delivery boy needed or not',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<BookserviceController>(context, listen: false).BookService(
                      context,
                      emailController.text.toString(),
                      stationnameController.text.toString(),
                      dateController.text.toString(),
                      timeController.text.toString(),
                      delboyController.text.toString(),
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
