import 'package:blog_app/components/CaategoryListItem.dart';
import 'package:blog_app/components/RecentPostList.dart';
import 'package:blog_app/components/TopPostCard.dart';
import 'package:blog_app/pages/AboutUs.dart';
import 'package:blog_app/pages/ContactUs.dart';
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
  var curdate = DateFormat('d MMM y').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Widget menuDrawer() {
      return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.pinkAccent),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                ),
                accountName: Text("Md. Shakil Hossen"),
                accountEmail: Text("shakilhossain38@gmail.com")),
            ListTile(
              onTap: () {
                print("Shakil");
              },
              leading: Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
              },
              leading: Icon(
                Icons.feedback,
                color: Colors.grey,
              ),
              title: Text(
                "About us",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUS()));
              },
              leading: Icon(Icons.contacts, color: Colors.amber),
              title: Text(
                "Contact us",
                style: TextStyle(color: Colors.amber),
              ),
            ),
            ListTile(
              onTap: () {
                print("Shakil");
              },
              leading: Icon(
                Icons.lock_open,
                color: Colors.red,
              ),
              title: Text(
                "Login",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    }

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
      drawer: menuDrawer(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Blogs Today",
              style: TextStyle(fontSize: 25.0, fontFamily: 'Roboto'),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  curdate,
                  style: TextStyle(
                      fontSize: 20.0, fontFamily: 'Roboto', color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.today,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          TopPostCard(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Top categories",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
          ),
          // SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: CategoryListItem(),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Text(
              "Most Recent Post",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RecentPostItem(),
          ),
        ],
      ),
    );
  }
}
