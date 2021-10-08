import 'package:flutter/material.dart';

class BusinessScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BusinessScreenState();
}

class BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '商家'
        ),
      )
    );
  }

}