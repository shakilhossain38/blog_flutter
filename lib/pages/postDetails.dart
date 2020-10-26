import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PostDetails extends StatelessWidget {

  final image;
  final author;
  final postDate;
  final comments;
  final totalLike;
  final title;
  final body;
  final categoryName;
  final createDate;
  PostDetails({this.body,
    this.image,
    this.author,
    this.title,
    this.categoryName,
    this.comments,
    this.createDate,
    this.totalLike,
    this.postDate});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(child: Text(author)),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 22.0),),
              SizedBox(height: 20.0),
              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(image),),
              SizedBox(height: 20.0,),
              Text(body,style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 22.0),),
              SizedBox(height: 20.0,),
             Row(
               children: <Widget>[

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("By : "+ author,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 16.0),),
                 ),
                 SizedBox(height:10.0, width:10.0,),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("Posted on : "+ postDate,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 16.0),),
                 ),

               ],
             ),

              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Comments area",style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto', fontSize: 20.0),),
              ),
              Container(child:
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextField(decoration: InputDecoration(
                          hintText: 'Write something',
                          labelText: 'Comment',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )
                        ),),
                      ),
                    ),

                    InkWell(
                      onTap: (){},
                    
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 30.0,
                          width: 100.0,
                          decoration: BoxDecoration(

                              color: Colors.blue,borderRadius: BorderRadius.circular(20.0)),


                            child: Center(child: Text("Comment ->"))),
                      ),
                    ),
                  ],
                ),)

            ],
          ),
        ),
      ),

    );
  }
}
