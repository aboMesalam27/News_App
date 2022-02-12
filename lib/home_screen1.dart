import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:news/model1.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);



  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}
Future <List<Model1>>getDataFromAPI() async {
  List<Model1>listOfData=[];
  var Url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(Url);
  var responseBody = jsonDecode(response.body);
  for (var i in responseBody) {
    Model1 object = Model1(
      userId: i["userId"],
      id: i["id"],
      title: i["title"],
      body: i['body'],
    );
    listOfData.add(object);
  }
  return listOfData;
}
class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("NEWS"),
      ),
      body: FutureBuilder(
        future: getDataFromAPI(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount:snapshot.data.length ,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Text("${snapshot.data[index].userId}"),
                      Text("${snapshot.data[index].id}"),
                      Text("${snapshot.data[index].title}"),
                    ],
                  ),
                );
              },);
          }
          else{
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        },),
    );
  }
}
