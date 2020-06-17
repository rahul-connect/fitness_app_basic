import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'exercise_screen.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;

  const ExerciseStartScreen({this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 10;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: widget.exercises.id,
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.exercises.thumbnail,
              placeholder: (context,url)=>Image(
                image: AssetImage("assets/placeholder.png"),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),

            Container(
               width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF000000),
                  Color(0x00000000),
                ],
                begin:Alignment.bottomCenter,
                end: Alignment.center
                )
              )
            ),
            Positioned(

              bottom: 40,
              left: 0,
              right: 0,
                          child: Container(
                 width: 200,
                height: 200,
                child: SleekCircularSlider(
                  appearance:CircularSliderAppearance(),
                  onChange:(double value){
                    seconds = value.toInt();
                  },
                  initialValue: 30,
                  min: 10,
                  max: 60,
                  innerWidget: (v){
                    return Container(
                      alignment: Alignment.center,
                      child: Text("${v.toStringAsFixed(0)} S",style: TextStyle(
                        color:Colors.white,
                        fontSize:20,
                      

                      ),),
                    );
                  },

                ),

              ),
            ),
            Container(
              alignment: Alignment.center,
              child:RaisedButton(
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExerciseScreen(exercises:widget.exercises,seconds: seconds,)));
                },
                child:Text("Start Exercise",style: TextStyle(
                  fontSize:20.0
                ),),
                color: Color(0xFFE83350),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                  
                ),
                splashColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
