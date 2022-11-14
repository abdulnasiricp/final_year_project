import 'dart:io';

import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/Screens/auth/sign_in.dart';
import 'package:buildapp/Screens/auth/sign_up.dart';
import 'package:buildapp/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDiWWjG89WP1jm0SotuI1jrgsBxaswaqaI", // Your apiKey
    appId: "1:743274900423:android:f69e28a5f6f40c6da507e2", // Your appId
    messagingSenderId: "743274900423", // Your messagingSenderId
    projectId: "build-app-c3c67",
    databaseURL: "https://build-app-c3c67-default-rtdb.firebaseio.com/",
    storageBucket: "gs://build-app-c3c67.appspot.com",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Build App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:

          // ChatScreenPage(
          // title: 'ChatScreen', name: 'Nasir', profession: 'Developer'),
          // HomScreen(),
          // SignUp(),
          // SignIn(),
          // ContractorList(),
          // MyBids(),

          // Chat(),
          // CreateBids(),

          // ProfileScreen(),
          // SignUp(),
          //  MyDrawar(title: ""),
          // BottomNavigationBarScreen(),
          // ForgotPass(),
          // HomeScreen(),

          LaunchScreen(),
    );
  }
}
