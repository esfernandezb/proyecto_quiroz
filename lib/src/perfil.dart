import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  Text('Elenafb', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Icon(Icons.check_circle, color: Colors.blueAccent,)
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Elena Fernandez' ),
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text('Ecuador.Guayaquil'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.cake_outlined),
                  Text('Julio 16,2000'),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Genero Mujer'),
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined),
                  Text('Se unió en Diciembre 2021'),
                ],
              ),

              MaterialButton(

                minWidth: 150.0,
                height: 40.0,
                onPressed: () {},
                color: Colors.orange,
                child: Text('Editar Perfil', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}