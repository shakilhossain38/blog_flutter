import 'dart:convert';

import 'package:blog_app/pages/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SelectCategory extends StatefulWidget {

  final categoryName;

  SelectCategory({
    this.categoryName,
  });
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  List categoryByPost= List();
  Future categoryByData() async{
    var url= "http://192.168.0.101/blog_flutter/categoryByPost.php";
    var response= await http.post(url, body: {'name': widget.categoryName});
    if(response.statusCode==200)
      {
        var jsonData= json.decode(response.body);
        setState(() {
          categoryByPost= jsonData;
        });
      }
    print(categoryByPost);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryByData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.categoryName)),),
      body: Container(
        child: ListView.builder(
            itemCount: categoryByPost.length,
            itemBuilder: (context,index){
          return PostItem(
            title: categoryByPost[index]['title'],
            author: categoryByPost[index]['author'],
            categoryName: categoryByPost[index]['categoryName'],
            image:
            "http://192.168.0.101/blog_flutter/uploads/${categoryByPost[index]['image']}",
            postDate: categoryByPost[index]['postDate'],
            comments: categoryByPost[index]['comments'],
            totalLike: categoryByPost[index]['totalLike'],
            body: categoryByPost[index]['body'],
            createDate: categoryByPost[index]['createDate'],

          );
        }),
      ),
    );
  }
}
class PostItem extends StatefulWidget {
  final image;
  final author;
  final postDate;
  final comments;
  final totalLike;
  final title;
  final body;
  final categoryName;
  final createDate;

  PostItem(
      {this.body,
        this.image,
        this.author,
        this.title,
        this.categoryName,
        this.comments,
        this.createDate,
        this.totalLike,
        this.postDate});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.amber, Colors.pink]),
            ),
          ),
        ),
        Positioned(
            top: 30,
            left: 20,
            child: CircleAvatar(
                radius: 20,
                //child: Icon(Icons.person),
                backgroundImage: NetworkImage(widget.image))),
        Positioned(
            top: 30,
            left: 80,
            child: Text(
              widget.author,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 30,
            left: 120,
            child: Text(
              widget.postDate,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[100],
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 50,
            left: 100,
            child: Icon(
              Icons.comment,
              color: Colors.grey[100],
            )),
        Positioned(
            top: 52,
            left: 140,
            child: Text(
              widget.comments,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[100],
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 50,
            left: 170,
            child: Icon(
              Icons.label,
              color: Colors.grey[100],
            )),
        Positioned(
            top: 52,
            left: 200,
            child: Text(
              widget.totalLike,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[100],
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: 100,
            left: 30,
            child: Text(
              widget.title,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.grey[100],
                  fontWeight: FontWeight.bold),
            )),

        Positioned(
          top: 155,
          left: 30,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetails(

                title: widget.title,
                author: widget.author,
                categoryName: widget.categoryName,
                image: widget.image,
                postDate: widget.postDate,
                comments: widget.comments,
                totalLike: widget.totalLike,
                body: widget.body,
                createDate: widget.createDate,


              )));
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.grey[100],
                ),
                Text(
                  "Read More",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.grey[100],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
