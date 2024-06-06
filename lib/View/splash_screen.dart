import 'dart:async';

import 'package:covid_tracker/View/world_state.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller= AnimationController(
  duration:const Duration(seconds: 5),
  vsync: this,
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(const Duration(seconds: 5), () =>
       Navigator.push(context, MaterialPageRoute(builder: (context) =>
       const WorldStateScreen(),)),);

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: RotationTransition(

                turns: _controller,
                child: Image.asset('images/virus.png'), // Replace with your image asset
              )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),

            const Text('Covid-2019',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
