import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarea4/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';


class registro extends StatefulWidget {
  @override
  _registroState createState() => _registroState();
}

class _registroState extends State<registro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController LastnameController = TextEditingController();
  TextEditingController CedulaController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswController = TextEditingController();
  bool _obscureText = true;
  bool passwordVisible= false;
  final _formKey = GlobalKey<FormState>();

  _showMsg(msg){
    final snackBar = SnackBar(
      backgroundColor: const Color(0XFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: ()  {
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _showMsgError(Map errors){
    var finalErrorMessage = '';
    errors.values.forEach((element) {
      finalErrorMessage += '\n' + element;
    });
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFFD50000),
      content: Text(finalErrorMessage),
      action: SnackBarAction(
        label: 'Close',
        onPressed: ()  {
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _register() async {
    var data = {
      'citizen_card': CedulaController.text,
      'first_name': nameController.text,
      'last_name': LastnameController.text,
      'email': EmailController.text,
      'password': PasswController.text
    };
    var res = await CallApi().postData(data, 'signup');
    var body = json.decode(res.body);

    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['data']['token']);
      localStorage.setString('first_name', body['data']['user']['first_name']);
      localStorage.setString('last_name', body['data']['user']['last_name']);
      localStorage.setString('citizen_card', body['data']['user']['citizen_card']);
      localStorage.setString('email', body['data']['user']['email']);
      localStorage.setString('joined_date', body['data']['user']['created_at']);

      _showMsg('Bienvenido, ' + body['data']['user']['first_name']);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else{
      _showMsgError(body['data']);
    }

  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: ListView(
            children:
            <Widget>[
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
                                'Registrate y administra tus pedidos desde ahora',
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
                              maxLength: 100,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese su nombre';
                                }if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                  return 'Por favor ingrese solo letras';
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller:nameController,
                              decoration: InputDecoration(
                                hintText: 'Nombre',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
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
                              maxLength: 100,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese su apellido';
                                }if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                  return 'Por favor ingrese solo letras';
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller:LastnameController,
                              decoration: InputDecoration(
                                hintText: 'Apellido',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
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
                              maxLength: 10,
                              validator: (value){
                                final intNumber = int.tryParse(value!);
                                if (intNumber != null && intNumber <= 9999999999){
                                  return null;
                                }
                                else{
                                  return 'Por favor ingrese su cédula';
                                }
                              },
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller: CedulaController,
                              decoration: InputDecoration(
                                hintText: 'Cedula',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
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
                              maxLength: 50,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese correo electrónico';
                                }if(!RegExp(r'^[\w-\.]+@([\w-]+\.)[\w]{2,4}').hasMatch(value)){
                                  return 'Por favor ingrese un email valido';
                                }

                              },
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller: EmailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
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
                              maxLength: 100,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese una contraseña';
                                }
                              },
                              style: const TextStyle(color: Colors.black,
                                  fontSize: 16),
                              keyboardType: TextInputType.text,
                              obscureText: passwordVisible,
                              controller: PasswController,
                              //This will obscure text dynamically
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                hintStyle: const TextStyle(
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
                            onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _register();
                            }

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

