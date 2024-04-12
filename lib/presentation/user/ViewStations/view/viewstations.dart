import 'package:ev_project/presentation/user/station_details/view/station_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../admin/ViewStations/controller/admin_home_controller.dart';

class ViewAllStations extends StatefulWidget {
  const ViewAllStations({Key? key});

  @override
  State<ViewAllStations> createState() => _ViewAllStationsState();
}

class _ViewAllStationsState extends State<ViewAllStations> {
  @override
  void initState() {
    Provider.of<ViewStationController>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Charging stations",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ViewStationController>(
        builder: (context, vcontroller, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: vcontroller.stationsList.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserStationDetals(
                          uid: vcontroller.stationsList.data?[index].uid.toString() ?? "",
                          name: vcontroller.stationsList.data?[index].name ?? "",
                          latitude: vcontroller.stationsList.data?[index].latitude.toString() ?? "",
                          longitude: vcontroller.stationsList.data?[index].longitude.toString() ?? "",
                          address: vcontroller.stationsList.data?[index].address ?? "",
                          operatingHours: vcontroller.stationsList.data?[index].operatingHours.toString() ?? "",
                          contact: vcontroller.stationsList.data?[index].contactInfo.toString() ?? "",
                          price: vcontroller.stationsList.data?[index].price.toString() ?? "",
                          status: vcontroller.stationsList.data?[index].bookedStatus.toString() ?? "",
                          photo: vcontroller.stationsList.data?[index].photo.toString() ?? "",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Icon(Icons.ev_station, size: 50, color: Colors.green)),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "${vcontroller.stationsList.data?[index].name}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
