import 'package:flutter/material.dart';

import 'home.dart';

class ruta_pedido extends StatefulWidget {
  const ruta_pedido({Key? key}) : super(key: key);

  @override
  _ruta_pedidoState createState() => _ruta_pedidoState();
}

class _ruta_pedidoState extends State<ruta_pedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: ListView(
            children: <Widget>[
              Form(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),

                      Text("Fecha"),

                      Padding(
                            padding: const EdgeInsets.all(5.0),
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

                     Padding(
                            padding: const EdgeInsets.all(5.0),
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

                         Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Shipper',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                            ),
                          ),

                     Padding(
                            padding: const EdgeInsets.all(5.0),
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


                     Padding(
                            padding: const EdgeInsets.all(5.0),
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

                      SizedBox(height: 30,),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                            disabledColor: Colors.orange,
                            child: Text("Volver a Home", style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),),
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
                      ),

                    ]),
              ),
            ]),
      ),
    );
  }
}
