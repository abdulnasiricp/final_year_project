import 'package:buildapp/Screens/home_and_general_screen/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 10,
              right: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "Assets/Images/forgotpassword.png",
                    width: 300,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Forgot Your Password?',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Please enter your registered email or number to rest your password',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: 'Email or Phone Number',
                        prefixIcon: Icon(Icons.email),
                      ),
                      // onChanged: (value) {
                      //   setState(() {
                      //     email = value;
                      //   });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 300,
                      height: 40,
                      child: RaisedButton(
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
