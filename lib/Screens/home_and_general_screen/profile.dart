import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  // ProfileScreen({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<ProfileScreen> {
  @override
  bool _isHidden = true;
  // final _auth = FirebaseAuth.instance;
  // String cust_name;
  // String email;
  // String password;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
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
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircularProfileAvatar(
                      '',
                      backgroundColor: Colors.brown,
                      // child: FlutterLogo(),
                      borderColor: Colors.purpleAccent,
                      borderWidth: 5,
                      elevation: 2,
                      radius: 70,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                      // onChanged: (val)async {
                      //   // setState(() {
                      //   //   cust_name = val;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Country',
                        prefixIcon: Icon(Icons.flag),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'State',
                        prefixIcon: Icon(Icons.home),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'City',
                        prefixIcon: Icon(Icons.home),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Home Address',
                        prefixIcon: Icon(Icons.home),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Work Title',
                        prefixIcon: Icon(Icons.group_work),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Experience',
                        prefixIcon: Icon(Icons.work),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Team Members',
                        prefixIcon: Icon(Icons.group),
                      ),
                      // onChanged: (val) async{
                      //   // setState(() {
                      //   //   email = value;
                      //   // });
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 300,
                      height: 40,
                      child: RaisedButton(
                        // icon: Icon(Icons.arrow_forward_rounded),
                        child: Text(
                          'Save',
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
                          Get.to(BottomNavigationBarScreen());
                          // FirebaseAuth.instance.createUserWithEmailAndPassword(
                          //   email: email, password: password)
                          //   .then(signedInUser){
                          //     _firbbase.collection('users')
                          //     .add({'email': email, 'pass' : password})
                          //     .then(value){
                          //       if(signedInUser != null){
                          //         Navigator.pushNamed(context, 'Home');
                          //       }
                          //     })
                          //   .catchError((e){
                          //     print(e);
                          //   });
                          // })
                          // .catchError((e){
                          //     print(e);
                          //   });
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
