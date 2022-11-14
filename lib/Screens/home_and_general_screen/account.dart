import 'package:buildapp/Screens/chats_screens/chats.dart';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/Screens/home_and_general_screen/contractor_profile.dart';
import 'package:buildapp/Screens/home_and_general_screen/dishboard.dart';
import 'package:buildapp/Screens/home_and_general_screen/profile.dart';
import 'package:buildapp/Screens/auth/sign_in.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.deepPurple.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage('Assets/Images/nasir pic.jpeg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Abdul Nasir',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text(' My Profile '),
                  onTap: () {
                    Get.to(ProfileAccount());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(' Home '),
                  onTap: () {
                    Get.to(BottomNavigationBarScreen());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(' Favorites '),
                  onTap: () {
                    Get.to(BottomNavigationBarScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text(' Messages '),
                  onTap: () {
                    Get.to(Chat());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.post_add_rounded),
                  title: const Text(' posted projects '),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                    Get.to(SignIn());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
