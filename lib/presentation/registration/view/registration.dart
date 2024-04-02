import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/registration_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegistrationFireState();
}

class _RegistrationFireState extends State<RegisterPage> {
  final name_ctrl = TextEditingController();
  final uname_ctrl = TextEditingController();
  final phone_ctrl = TextEditingController();
  final password_ctrl = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text("Sign-Up",style: TextStyle(
              fontSize: 40,fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Username",
                    labelText: "Username"),
                controller: name_ctrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Email",
                    labelText: "Email"),
                controller: uname_ctrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Phone number",
                    labelText: "Phone number"),
                controller: phone_ctrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password_ctrl,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Password must be 6 characters",
                  labelText: 'Password',
                  suffixIcon: _obscureText == false
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = true;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            size: 20,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = false;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            size: 20,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  ElevatedButton(onPressed: () {
                    Provider.of<RegistrationController>(context,listen: false).onRegistration(
                      context,
                      name_ctrl.text.trim(),
                      uname_ctrl.text.trim(),
                      phone_ctrl.text.trim(),
                      password_ctrl.text.trim());
                      
                      // name_ctrl.clear();
                      // uname_ctrl.clear();
                      // phone_ctrl.clear();
                      // password_ctrl.clear();
                  },
                   child: Text('Register',style: TextStyle(color: Colors.black))),
            )
          ],
        ),
      ),
    );
  }
}
