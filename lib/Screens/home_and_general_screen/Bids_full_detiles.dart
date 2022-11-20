import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class BidsFullDetile extends StatefulWidget {
  const BidsFullDetile({Key? key}) : super(key: key);
  _BidsFullDetileState createState() => _BidsFullDetileState();
}

class _BidsFullDetileState extends State<BidsFullDetile> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.reference().child('Posts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Full Detile'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(children: [
              Expanded(
                child: FirebaseAnimatedList(
                    query: ref.child('Post List'),
                    defaultChild: const Text('Loading'),
                    itemBuilder: (context, snapshot, animation, index) {
                      return Container(
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
                      );
                    }),
              ),
            ])));
  }
}
