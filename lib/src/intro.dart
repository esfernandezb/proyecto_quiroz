import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tarea4/src/page1.dart';
import 'package:animate_do/animate_do.dart';

class intro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>  page1())));
    return Scaffold(
      body: Center(
        child: ZoomOut(
          from:10,
            duration: Duration(seconds: 4),
            child: Image.asset('assets/jpg/dabf.png',width: 300, height: 300,)),
      ),
    );
  }
}