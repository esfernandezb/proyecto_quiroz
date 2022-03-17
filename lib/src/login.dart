import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarea4/src/home.dart';
import 'package:tarea4/src/registro.dart';

import '../services/api.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswController = TextEditingController();
  bool _obscureText = true;
  bool passwordVisible= true;
  String? token;
  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  bool _isEnabled = true;
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  _showMsgError(msg){
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFFD50000),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: ()  {
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login()async{
    var data ={
      'email': EmailController.text,
      'password': PasswController.text
    };
    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);

    print(body);

    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      localStorage.setString('token', body['data']['token']);
      localStorage.setString('first_name', body['data']['user']['first_name']);
      localStorage.setString('last_name', body['data']['user']['last_name']);
      localStorage.setString('citizen_card', body['data']['user']['citizen_card']);
      localStorage.setString('email', body['data']['user']['email']);
      print("+--------------------------+");
      print("Inicio de sesión, con éxito");
      print("+--------------------------+");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
     }else{
      _showMsgError('Usuario y/o Contraseña incorrectos');
    }

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(

              children: <Widget> [Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/jpg/dabflogo.png',width: 200, height: 250,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 30,
                          validator: (value){
                            if (value!.isEmpty) {
                              return 'Por favor ingrese correo electrónico';
                            }if(!RegExp(r'^[\w-\.]+@([\w-]+\.)[\w]{2,4}').hasMatch(value)){
                              return 'Por favor ingrese un email valido';
                            }

                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: EmailController,
                          style: TextStyle(color: Colors.black,fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox( height: 12,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 10,
                          validator: (value){
                            if (value!.isEmpty) {
                              return 'Por favor ingrese una contraseña';
                            }
                          },
                          style: TextStyle(color: Colors.black,
                              fontSize: 16),
                          keyboardType: TextInputType.text,
                          controller: PasswController,
                          obscureText: passwordVisible,
                          //This will obscure text dynamically
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            hintStyle: TextStyle(
                                fontSize: 16.0, color: Colors.black),
                            // Here is key idea
                            suffixIcon: IconButton(
                              icon: Icon(
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
                        ),
                      ),
                    ),
                    SizedBox( height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RaisedButton( shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                        disabledColor: Colors.orange,
                        child: Text("Iniciar sesión",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.white),),
                        splashColor: Colors.orange,
                        color: Colors.orange,
                        onPressed: () {
                         if (_formKey.currentState!.validate()) {
                          _login();}

                        },
                      ),
                    ),
                    SizedBox( height: 50,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child:
                          new Container(
                              margin: const EdgeInsets.only(left: 1.0, right: 1.0),
                              child: Divider(
                                color: Colors.black,
                                height: 10,
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Row(
                        children: <Widget>[
                          Text("¿No tienes una cuenta?",style: TextStyle(fontStyle: FontStyle.normal,color: Colors.black),),
                          Container(
                            width: 110,
                            height: 60,
                            child: FlatButton(
                              // splashColor: Colors.red,
                              color: Colors.white,
                              // textColor: Colors.white,
                              child: Text('Registrate',style: TextStyle(color: Colors.orange),),
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => registro()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ]),
        ),

      ),
    );
  }
}