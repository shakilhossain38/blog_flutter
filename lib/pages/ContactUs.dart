import 'package:flutter/material.dart';
class ContactUS extends StatefulWidget {
  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Contact Us"),),),
    body: Center(child: Text("Contact us", style: TextStyle(fontSize: 25.0,fontFamily: "Roboto", fontWeight: FontWeight.bold),),),
    );
  }
}
