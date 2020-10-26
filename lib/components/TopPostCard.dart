import 'dart:convert';

import 'package:blog_app/pages/postDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopPostCard extends StatefulWidget {
  @override
  _TopPostCardState createState() => _TopPostCardState();
}

class _TopPostCardState extends State<TopPostCard> {
  List postData = List();

  Future showAllPost() async {
    var url = 'http://192.168.0.105/blog_flutter/postAll.php';
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        postData = jsonData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: postData.length == null
              ? CircularProgressIndicator()
              : postData.length,
          itemBuilder: (context, index) {
            return NewPostItem(
              title: postData[index]['title'],
              author: postData[index]['author'],
              categoryName: postData[index]['categoryName'],
              image:
                  "http://192.168.0.105/blog_flutter/uploads/${postData[index]['image']}",
              postDate: postData[index]['postDate'],
              comments: postData[index]['comments'],
              totalLike: postData[index]['totalLike'],
              body: postData[index]['body'],
              createDate: postData[index]['createDate'],
            );
          }),
    );
  }
}

class NewPostItem extends StatefulWidget {
  final image;
  final author;
  final postDate;
  final comments;
  final totalLike;
  final title;
  final body;
  final categoryName;
  final createDate;

  NewPostItem(
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
  _NewPostItemState createState() => _NewPostItemState();
}

class _NewPostItemState extends State<NewPostItem> {
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
