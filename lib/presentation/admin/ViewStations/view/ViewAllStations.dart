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
    super.initState();
    Provider.of<ViewStationController>(context,listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ViewStationController>(builder: (context, vcontroller, child) {
        return vcontroller.isLoading?Center(child: CircularProgressIndicator()): ListView.builder(
        itemCount: vcontroller.stationsList.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StationDetals()));
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("${vcontroller.stationsList.data?[index].name}"),
              ),
            ),
          );
        },
      );
        
      },)
    );
  }
}
