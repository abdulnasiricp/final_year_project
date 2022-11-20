import 'package:buildapp/Screens/home_and_general_screen/Bids_full_detiles.dart';
import 'package:buildapp/Screens/home_and_general_screen/contractor_profile.dart';
import 'package:buildapp/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.reference().child('Posts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref.child('Post List'),
                defaultChild: const Text('Loading'),
                itemBuilder: (context, snapshot, animation, index) {
                  return Column(children: [
                    InkWell(
                      onTap: (() {
                        Get.to(BidsFullDetile());
                      }),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshot.child('_pTitle').value.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  snapshot.child('_pPrice').value.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                image: AssetImage('Assets/Images/building.jpg'),
                                fit: BoxFit.cover,
                                // width: MediaQuery.of(context).size.width*1,
                                // height: MediaQuery.of(context).size.height*.25,

                                // FadeInImage(
                                // placeholder: 'Assets/Images/wel.PNG',
                                //  image:  snapshot.child('_pImage').value.toString(),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // // Text(snapshot.child('_pTitle').value.toString()),
                    // Text(snapshot.child('_pLocation').value.toString()),
                    // Text(snapshot.child('_pCategory').value.toString()),
                    // Text(snapshot.child('_pPrice').value.toString()),
                    // Text(snapshot.child('_pPhone').value.toString()),
                    // Text(snapshot.child('_pDescription').value.toString()),
                  ]

                      // subtitle: Text(snapshot.child('id').value.toString()),
                      );
                }),
          ),
        ]),
      ),
    );
  }
}

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);
//   _DishboardState createState() => _DishboardState();
// }

// class _DishboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: GridView.extent(
//           primary: false,
//           padding: const EdgeInsets.all(16),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           maxCrossAxisExtent: 200.0,
//           children: <Widget>[
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Nasir',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.63k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.fitWidth),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Ismail',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.26k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Naseem',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.32k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Ali',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.28k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Yasir',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.53k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     child: CircleAvatar(
//                       backgroundImage:
//                           AssetImage('Assets/Images/nasir pic.jpeg'),
//                     ),
//                     onTap: (() {
//                       Get.to(ProfileAccount());
//                     }),
//                   ),
//                   Text('Ahmad',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                   Spacer(),
//                   Text('Rs.24k',
//                       style: TextStyle(
//                           fontSize: 15,
//                           backgroundColor: Colors.white,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70.0),
//                 ),
//                 image: DecorationImage(
//                     image: AssetImage('Assets/Images/building.jpg'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
