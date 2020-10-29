import 'dart:convert';

import 'package:blog_app/pages/postDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecentPostItem extends StatefulWidget {
  @override
  _RecentPostItemState createState() => _RecentPostItemState();
}

class _RecentPostItemState extends State<RecentPostItem> {
  List recentData = List();

  Future recentPost() async {
    var url = 'http://192.168.0.101/blog_flutter/postAll.php';
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        recentData = jsonData;
        //print(postData);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recentPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,

      child: ListView.builder(
          itemCount: recentData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.green, Colors.pink, Colors.teal, Colors.blue])
              ),
              child: RecentPost(
                categoryName: recentData[index]['categoryName'],
                totalLike: recentData[index]['totalLike'],
                comments: recentData[index]['comments'],
                body: recentData[index]['body'],
                title: recentData[index]['title'],
                author: recentData[index]['author'],
                createDate: recentData[index]['createDate'],
                postDate: recentData[index]['postDate'],
                image:
                    'http://192.168.0.101/blog_flutter/uploads/${recentData[index]['image']}',
              ),
            );
          }),
    );
  }
}

class RecentPost extends StatefulWidget {
  final id;
  final image;
  final author;
  final createDate;
  final postDate;
  final title;
  final categoryName;
  final body;
  final comments;
  final totalLike;

  RecentPost(
      {this.author,
      this.image,
      this.title,
      this.id,
      this.createDate,
      this.postDate,
      this.categoryName,
      this.body,
      this.totalLike,
      this.comments});

  @override
  _RecentPostState createState() => _RecentPostState();
}

class _RecentPostState extends State<RecentPost> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetails(
                                  image: widget.image,
                                  author: widget.author,
                                  createDate: widget.createDate,
                                  postDate: widget.postDate,
                                  title: widget.title,
                                  totalLike: widget.totalLike,
                                  categoryName: widget.categoryName,
                                  comments: widget.comments,
                                  body: widget.body,
                                )));
                  },
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 20.0, fontFamily: "Roboto"),
                  )),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Posted by " + widget.author,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Posted on " + widget.postDate,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              widget.image,
              width: 70.0,
              height: 70.0,
            ),
          ),
        ),
      ],
    );
  }
}
