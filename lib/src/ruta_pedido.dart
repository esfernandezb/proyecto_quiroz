import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class ruta_pedido extends StatefulWidget {
  const ruta_pedido({Key? key, required this.order}) : super(key: key);

  // Declare a field that holds the order.
  final Map order;

  @override
  _ruta_pedidoState createState() => _ruta_pedidoState();
}

class _ruta_pedidoState extends State<ruta_pedido>
{
  @override
  Widget build(BuildContext context) {
    final String _url = "http://192.168.100.53:8000/api/order/" + widget.order['id'].toString();

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

    _getToken() async{
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token').toString();
      return token;
    }

    updateOrderStatus() async {
      var token = await _getToken();
      var response = await http.put(
          Uri.parse(_url),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }
      );

      var jsonData = jsonDecode(response.body);
      if(jsonData['status'] == false){
        _showMsgError('No se puede cancelar la orden');
      } else {
        _showMsg('Orden cancelada');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    }

    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: ListView(
            children: <Widget>[
              Form(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),

                      Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Consignee: " + widget.order["consignee"])
                          ),

                     Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Carrier: " + widget.order["carrier"])
                          ),

                         Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Shipper: " + widget.order["shipper"])
                          ),

                     Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Valor de la compra: " + widget.order["total_price"])
                     ),


                     Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Order details: " + widget.order["purchase_detail"])
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
                            child: Text("Cancelar Orden", style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            splashColor: Colors.redAccent,
                            color: Colors.redAccent,
                            onPressed: () {
                              updateOrderStatus();
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
