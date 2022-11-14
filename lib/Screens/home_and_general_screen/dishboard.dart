import 'package:buildapp/Screens/home_and_general_screen/contractor_profile.dart';
import 'package:buildapp/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        FirebaseAnimatedList(
            query: ref,
            defaultChild: Text('Loading'),
            itemBuilder: (context, snapshot, animation, index) {
              return ListTile(
                title: Text(snapshot.child('title').value.toString()),
                // subtitle: Text(snapshot.child('id').value.toString()),
                trailing: PopupMenuButton(
                    color: Colors.white,
                    elevation: 4,
                    padding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    icon: Icon(
                      Icons.more_vert,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);

                                  ref
                                      .child(
                                          snapshot.child('id').value.toString())
                                      .update({'title': 'nice world'})
                                      .then((value) {})
                                      .onError((error, stackTrace) {
                                        Utils().toastMessage(error.toString());
                                      });
                                },
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);

                                // ref.child(snapshot.child('id').value.toString()).update(
                                //     {
                                //       'ttitle' : 'hello world'
                                //     }).then((value){
                                //
                                // }).onError((error, stackTrace){
                                //   Utils().toastMessage(error.toString());
                                // });
                                ref
                                    .child(
                                        snapshot.child('id').value.toString())
                                    .remove()
                                    .then((value) {})
                                    .onError((error, stackTrace) {
                                  Utils().toastMessage(error.toString());
                                });
                              },
                              leading: Icon(Icons.delete_outline),
                              title: Text('Delete'),
                            ),
                          ),
                        ]),
              );
            }),

        // Expanded(
        //   child: FirebaseAnimatedList(
        //     query: ref,
        //     defaultChild: Text('Loading'),
        //     itemBuilder: (context, snapshot, animation, index) {
        //       return ListTile(
        //         title: Text(snapshot.child('title').value.toString()),
        //       );
        //     },
        //   ),
        // )
      ]),
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
