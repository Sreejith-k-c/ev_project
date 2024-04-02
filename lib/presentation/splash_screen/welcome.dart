import 'package:ev_project/app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user/BottomNavigation/view/bottomnav.dart';
import 'splash.dart';


class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  late SharedPreferences sharedPreferences;
  late bool checkLogged;

  Future<void> checkLogin() async{
    sharedPreferences=await SharedPreferences.getInstance();
    checkLogged=sharedPreferences.getBool(AppConfig.status)??false;
  }

  @override
  void initState() { 
    checkLogin().then((Value) {
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>checkLogged? BottomNavBar():SplashScreen()));
      });
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/ev_logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}