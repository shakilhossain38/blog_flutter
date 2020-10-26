import 'package:blog_app/components/CaategoryListItem.dart';
import 'package:blog_app/components/TopPostCard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var curdate= DateFormat('d MMM y').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            width: 150.0,
            height: 50.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          )
        ],

      ),
      drawer: Drawer(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Blogs Today",style: TextStyle(fontSize: 25.0,fontFamily: 'Roboto'),),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(curdate,style: TextStyle(fontSize: 20.0,fontFamily: 'Roboto',color: Colors.grey),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.today,color: Colors.red,),
              ),
            ],
          ),
          TopPostCard(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Top categories", style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, fontFamily: 'Roboto'),),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryListItem(),
          ),


        ],
      ),
    );
  }
}
