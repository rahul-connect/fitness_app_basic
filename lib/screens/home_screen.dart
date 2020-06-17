import 'package:fitnessapp/model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'exerise_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub exerciseHub;

  @override
  void initState() {
    getExercises();
    super.initState();
  }

  void getExercises() async {
    var response = await http.get(apiUrl);
    var body = response.body;
    var decodedJson = json.decode(body);
    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FITNESS APP"),
          centerTitle: true,
        ),
        body: Container(
          child: exerciseHub != null
              ? ListView.builder(
                  itemCount: exerciseHub.exercises.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExerciseStartScreen(exercises: exerciseHub.exercises[index],)));
                      },
                      child: Hero(
                        tag: exerciseHub.exercises[index].id,
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        exerciseHub.exercises[index].thumbnail,
                                    placeholder:(context,url)=> Image(
                                       image: AssetImage('assets/placeholder.png'),
                                    width: MediaQuery.of(context).size.width,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                  ),),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Color(0xFF000000),
                                        Color(0x00000000)
                                      ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.center)),
                                ),
                              ),
                              Container(
                                height: 250.0,
                                padding:
                                    EdgeInsets.only(left: 10.0, bottom: 10.0),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  exerciseHub.exercises[index].title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
