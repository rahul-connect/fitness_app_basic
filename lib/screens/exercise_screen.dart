import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/model/exercise.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ExerciseScreen extends StatefulWidget {
  final Exercises exercises;
  final int seconds;

  const ExerciseScreen({this.exercises,this.seconds});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool _isCompleted=false;
  int _elapsedSeconds =0;

  Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  @override
  void initState() {
   timer = Timer.periodic(Duration(seconds: 1), (t){
     if(t.tick== widget.seconds){
       t.cancel();
       setState(() {
         _isCompleted = true;
       });
       playAudio();
     }
     setState(() {
       _elapsedSeconds = t.tick;
     });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void playAudio()async{
    
    await audioCache.play("sound.wav");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: CachedNetworkImage(
                  imageUrl: widget.exercises.gif,
                  placeholder: (context,url)=>Image(
                    image: AssetImage("assets/placeholder.png"),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  fit: BoxFit.cover,
                )
          ),
          _isCompleted!=true?SafeArea(
                      child: Container(
              alignment: Alignment.topCenter,
              child: Text("$_elapsedSeconds/${widget.seconds} S"),
            ),
          ):Container(),
          SafeArea(
            child: IconButton(icon: Icon(Icons.close), onPressed: (){
              Navigator.pop(context);
            }),
          ),
        ],
      ),
      
    );
  }
}