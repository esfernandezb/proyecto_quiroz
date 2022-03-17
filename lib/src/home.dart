import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tarea4/src/lista.dart';
import 'package:tarea4/src/pedido.dart';
import 'package:tarea4/src/perfil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}


class _HomeState extends State {
  int selectedpage = 0; //initial value

  final _pageOptions = [lista(), pedido(), perfil()]; // listing of all 3 pages index wise

  final bgcolor = [Colors.orangeAccent, Colors.orange, Colors.deepOrangeAccent];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedpage], // initial value is 0 so HomePage will be shown
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        buttonBackgroundColor: Colors.deepOrange,
        backgroundColor: bgcolor[selectedpage],
        color: Colors.white,
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.list_alt_outlined,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.black,
          )
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index;  // changing selected page as per bar index selected by the user
          });
        },
      ),
    );
  }
}


