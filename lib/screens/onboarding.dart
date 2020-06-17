import 'package:fitnessapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pages = [
    PageViewModel(
        title: "Exercise Makes you healthy and Active",
        body: "",
        image: Padding(
          padding: const EdgeInsets.only(top:150.0),
          child: Center(
            child: Image.asset("assets/image3.png", height: 500.0),
          ),
        ),
        decoration: PageDecoration(pageColor: Colors.white)),
    PageViewModel(
        title: "Weight lifing helps to gain muscle Mass",
        body: "",
        image: Padding(
          padding: const EdgeInsets.only(top:150.0),
          child: Center(
            child: Image.asset("assets/image4.jpg", height: 500.0),
          ),
        ),
        decoration: PageDecoration(pageColor: Colors.white)),
    PageViewModel(
        title: "Your Body is the only asset you have",
        body: "",
        image: Padding(
          padding: const EdgeInsets.only(top:150.0),
          child: Center(
            child: Image.asset("assets/image5.jpg", height: 500.0),
          ),
        ),
        decoration: PageDecoration(pageColor: Colors.white)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
        },
        done: Icon(Icons.check_circle),
        showSkipButton: false,
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.navigate_next),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.green,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
