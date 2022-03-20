import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tarea4/src/page1.dart';
import 'package:animate_do/animate_do.dart';

class intro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 1),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>  page1())));
    return Scaffold(
      body: Center(
        child: ZoomOut(
          from:10,
            duration: Duration(seconds: 2),
            child: Image.asset('assets/jpg/dabflogo.png',width: 100, height: 100,)),
      ),
    );
  }
}