import 'package:flutter/material.dart';

class ActiveBids extends StatefulWidget {
  const ActiveBids({Key? key}) : super(key: key);
  _ActiveBidsState createState() => _ActiveBidsState();
}

class _ActiveBidsState extends State<ActiveBids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Active bids',
          style: (TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
