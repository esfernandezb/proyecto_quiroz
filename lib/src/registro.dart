
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class registro extends StatefulWidget {
  @override
  _registroState createState() => _registroState();
}

class _registroState extends State<registro> {

  final _formKey = GlobalKey<FormState>();

  var email = TextEditingController();
  var nombre = TextEditingController();
  var apellido = TextEditingController();
  var cedula = TextEditingController();
  var usuario = TextEditingController();
  var password = TextEditingController ();
  bool _obscureText = true;
  bool passwordVisible= true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void initState() {
    passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                    children: <Widget>[
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.redAccent,
                                  Colors.deepOrange,
                                  Colors.amber
                                ],
                                stops: [0.2, 0.4, 1.0],
                                begin: FractionalOffset.topRight,
                                end: FractionalOffset.bottomCenter)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 40,),
                              Image.asset('assets/jpg/dabf.png', width: 200,
                                height: 200,
                                color: Colors.white
                                ,),
                              Text(
                                'Registrate para ver tus trackings y estado de tus pedidos',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),

                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Nombre',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              controller: nombre,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Apellido',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              controller: apellido,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Cedula',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              controller: cedula,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Correo',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              controller: email,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Usuario',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                              controller: usuario,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              keyboardType: TextInputType.text,
                              obscureText: passwordVisible,
                              //This will obscure text dynamically
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                // Here is key idea
                                suffixIcon: IconButton(
                                  color: Colors.black,
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Theme
                                        .of(context)
                                        .primaryColorLight,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              controller: password,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RaisedButton(shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                            disabledColor: Colors.orange,
                            child: Text("Registrarse", style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),),
                            splashColor: Colors.orange,
                            color: Colors.orange,
                            onPressed: () async {
                              //Navigator.push(
                                //context,
                                //MaterialPageRoute(builder: (context) => login()),
                              //);
                              print('datos ingresados');
                              await FirebaseFirestore.instance.collection('users').add({
                                'nombre': nombre.text,
                                'apellido': apellido.text,
                                'cedula': cedula.text,
                                'correo': email.text,
                                'usuario': usuario.text,
                                'contraseña': password.text,

                              });
                              Navigator.push(
                              context,
                             MaterialPageRoute(builder: (context) => login()),
                             );

                            },

                          ),
                        ),
                      ),

                    ]),
              ),
            ]),
      ),
    );
  }
  }

