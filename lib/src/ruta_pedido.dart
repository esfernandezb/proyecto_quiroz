import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        color: Colors.white54,
        child: ListView(
            children: <Widget>[
              Form(
                child: Column(
                    children: <Widget>[
                      Container(height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.5],
                            colors: [
                              Color(0xFFFF422C),
                              Color(0xFFFF9003),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100.0)),
                        ),
                        child: SvgPicture.asset('assets/svg/slide3.svg'),

                      ),
                     Container(
                       margin: EdgeInsets.all(30),
                       width:300,
                       height:400,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         gradient: const LinearGradient(
                           colors: [
                             Color(0xFFFFCC80),
                             Colors.orangeAccent,
                           ],
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           stops: [0.25, 0.90],
                         ),
                         boxShadow: const [
                           BoxShadow(
                             color: Colors.deepOrangeAccent,
                             offset: Offset(-12, 12),
                             blurRadius: 8,
                           ),
                         ],
                       ),
                        //to align its child


                         child: Container(
                           padding: const EdgeInsets.only(top: 10, left: 20.0, right: 20.0, bottom: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: const [
                                   Text("Consignee:    ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),textAlign: TextAlign.start,)
                                   ,


                                   Text("Carrier:         ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),textDirection: TextDirection.ltr),

                                    Text("Shipper:        ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),textDirection: TextDirection.ltr)
                                   ,
                                    Text("Valor compra: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),textDirection: TextDirection.ltr)
                                   ,


                                   Text("Order details: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),textAlign: TextAlign.start)
                                   ,

                                 ],
                               ),
                               Expanded(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(widget.order["consignee"],style: TextStyle(fontSize: 15,),textDirection: TextDirection.ltr, maxLines: 2, overflow: TextOverflow.ellipsis,)
                                     ,


                                     Text(widget.order["carrier"],style: TextStyle(fontSize: 15),textDirection: TextDirection.ltr, maxLines: 2, overflow: TextOverflow.ellipsis,),

                                     Text(widget.order["shipper"],style: TextStyle(fontSize: 15),textDirection: TextDirection.ltr, maxLines: 2, overflow: TextOverflow.ellipsis,)
                                     ,
                                     Text(widget.order["total_price"],style: TextStyle(fontSize: 15),textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis,)
                                     ,


                                     Text(widget.order["purchase_detail"],style: TextStyle(fontSize: 15),textDirection: TextDirection.ltr, maxLines: 3, overflow: TextOverflow.ellipsis,)
                                     ,

                                   ],
                                 ),
                               ),
                             ],

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
