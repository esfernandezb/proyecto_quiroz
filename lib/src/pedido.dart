import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class pedido extends StatefulWidget {
  @override
  _pedidoState createState() => _pedidoState();
}

class _pedidoState extends State<pedido> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Pedido'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white70,
        child: ListView(
            children: <Widget>[
              Form(
                child: Column(
                    children: <Widget>[
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
                                hintText: 'Date Shipper',
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
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Consignee',
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
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Carrier',
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
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Tracking',
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
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Valor de la compra',
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
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              keyboardType: TextInputType.text,
                              //This will obscure text dynamically
                              decoration: InputDecoration(
                                hintText: 'Factura Compra',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                // Here is key idea

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
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              keyboardType: TextInputType.text,
                              //This will obscure text dynamically
                              decoration: InputDecoration(
                                hintText: 'Detalle Compra',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                // Here is key idea

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