import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea4/src/home.dart';
import 'package:tarea4/src/registro.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  bool _obscureText = true;
  bool passwordVisible= true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  bool _isEnabled = true;
  void initState() {
    passwordVisible = false;
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(

              children: <Widget> [Form(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/jpg/dabf.png',width: 250, height: 250,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orangeAccent),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black,fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Usuario',
                            hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox( height: 12,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orangeAccent),
                          color: Colors.white,
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
                        child: Text("Iniciar sesión",style: TextStyle(fontStyle: FontStyle.normal,fontSize:16,fontWeight: FontWeight.bold,color: Colors.black),),
                        splashColor: Colors.orange,
                        color: Colors.orange,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
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
                                height: 30,
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