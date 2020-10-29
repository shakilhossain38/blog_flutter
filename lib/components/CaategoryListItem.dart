import 'dart:convert';
import 'package:blog_app/pages/SelectCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryListItem extends StatefulWidget {
  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  List categories = List();

  Future getAllCategory() async {
    var url = 'http://192.168.0.101/blog_flutter/category.php';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categories = jsonData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              categoryName: categories[index]['name'],
              createDate: categories[index]['createDate'],
            );
          }),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final categoryName;
  final createDate;

  CategoryItem({this.categoryName, this.createDate});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectCategory(
                    categoryName: widget.categoryName,
                  )));
            },
            child: Text(
              widget.categoryName,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.blue),
            )),
      ),
    );
  }
}
