import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'editar_perfil.dart';

class perfil extends StatelessWidget {
  const perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(20),
        width:double.infinity,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(0, 2),
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(15),
                  width: 180.0,
                  height: 180.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage(
                              "assets/jpg/dabf.png")
                      )
                  )
              ),

              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text('Elena Fernandez'),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.credit_card_sharp),
                  SizedBox(width: 10),
                  Text('0123456789'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.mail),
                  SizedBox(width: 10),
                  Text('ee@gmail.com'),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.calendar_today_outlined),
                  SizedBox(width: 10),
                  Text('Se unió en Diciembre 2021'),
                ],
              ),
              SizedBox(height: 20),
              RaisedButton(shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
                disabledColor: Colors.orange,
                child: Text("Editar Perfil", style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
                splashColor: Colors.orange,
                color: Colors.orange,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => editar()),
                  );

                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}