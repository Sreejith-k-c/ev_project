import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../StationsDetails/view/station_view.dart';
import '../controller/admin_home_controller.dart';

class ViewAllStations extends StatefulWidget {
  const ViewAllStations({Key? key});

  @override
  State<ViewAllStations> createState() => _ViewAllStationsState();
}

class _ViewAllStationsState extends State<ViewAllStations> {
  @override
  void initState() {
    Provider.of<ViewStationController>(context,listen: false).fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ViewStationController>(builder: (context, vcontroller, child) {
        return ListView.builder(
        itemCount: vcontroller.stationsList.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StationDetals(
                  uid: vcontroller.stationsList.data?[index].uid.toString() ?? "",
                  name: vcontroller.stationsList.data?[index].name ?? "",
                  latitude: vcontroller.stationsList.data?[index].latitude.toString() ?? "",
                  longitude: vcontroller.stationsList.data?[index].longitude.toString() ?? "",
                  address: vcontroller.stationsList.data?[index].address ?? "",
                  operatingHours: vcontroller.stationsList.data?[index].operatingHours.toString() ?? "",
                  contact: vcontroller.stationsList.data?[index].contactInfo.toString() ?? "",
                  price: vcontroller.stationsList.data?[index].price.toString() ?? "",
                  status: vcontroller.stationsList.data?[index].bookedStatus.toString() ?? "",
                  photo:vcontroller.stationsList.data?[index].photo.toString() ?? ""
                  )));
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("${vcontroller.stationsList.data?[index].name}")),
              ),
            ),
          );
        },
      );
      },)
    );
  }
}
