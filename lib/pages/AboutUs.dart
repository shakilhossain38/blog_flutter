import 'package:flutter/material.dart';
class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Center(child: Text("About Us", style: TextStyle(fontSize: 25.0,fontFamily: "Roboto", fontWeight: FontWeight.bold),),),),
      body: Center(child: Text("About us", style: TextStyle(fontSize: 25.0,fontFamily: "Roboto", fontWeight: FontWeight.bold),),),
    );
  }
}
