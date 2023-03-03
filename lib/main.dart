import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'model_post.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrofit Post Call"),
      ),
      //body: Center(

        body: _buildBody(context),


    );
  }
}

FutureBuilder<List<Post>> _buildBody(BuildContext context){
  final client =RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<List<Post>>(
    future:client.getTask("photos"),
    builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        final List<Post>? get=snapshot.data ;
        return _buildPosts(context,get ?? []);
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}



ListView _buildPosts(BuildContext context,List<Post> get){
  return ListView.builder(
    itemCount: get.length,
    itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          elevation: 4,
          child: ListTile(
            title: Text(get[index].title),

          ),
        ),
      );
    },
  );
}