import 'package:ev_project/presentation/splash_screen/splash_one.dart';
import 'package:ev_project/presentation/splash_screen/splash_three.dart';
import 'package:ev_project/presentation/splash_screen/splash_two.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/view/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController _controller=PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
          controller: _controller,
          onPageChanged: (index){
            setState(() {
              onLastPage=(index==2);
            });
          },
        children: [
          SplashOne(),
          SplashTwo(),
          SplashThree(),
        ],
      ),
      Container(
        alignment: Alignment(0,0.85),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.26),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    _controller.jumpToPage(2);
                  },
                  child: Text("Skip",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)),
            
                SmoothPageIndicator(controller: _controller, count: 3),
            
                onLastPage?
                GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>LoginPage()));
                  },
                  child: Text("Done",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),))
                  :GestureDetector(
                  onTap: (){
                     _controller.nextPage(duration: Duration(milliseconds: 500),
                     curve: Curves.linear);
                  },
                  child: Text("Next",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),))
              ],
            ),
          ),
        ))
        ],
      )
    );
  }
}