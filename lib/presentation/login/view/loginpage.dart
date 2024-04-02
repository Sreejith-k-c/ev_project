import 'package:ev_project/presentation/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../registration/view/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final passwd_ctrl = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 60),
              Text("Login",style: TextStyle(
                fontSize: 40,fontWeight: FontWeight.bold
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                'assets/lottie/Animation - 1711437141413.json',
                height: 250,
                width: 250,
                          ),
              ),
              Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration:
                    InputDecoration(border: OutlineInputBorder(), hintText: "Username"),
                controller: name_ctrl,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
                controller: passwd_ctrl,
                obscureText: _obscureText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<LoginController>(context,listen: false).onLogin(
                    context,
                    name_ctrl.text.trim(),
                    passwd_ctrl.text.trim());
                    name_ctrl.text.trim();
                    uname_ctrl.clear();
                    passwd_ctrl.clear();
                },
                child: const Text('Login',style: TextStyle(color: Colors.black),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text("Not a user? Register here!!",
                style: TextStyle(color: Colors.black),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
