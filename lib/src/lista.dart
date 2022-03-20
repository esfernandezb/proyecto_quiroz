import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tarea4/src/ruta_pedido.dart';


class lista extends StatefulWidget {

  static final String _url = "http://192.168.100.53:8000/api/order";

  @override
  State<lista> createState() => _listaState();
}

class _listaState extends State<lista> {
  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token;
  }
  List<Map> ordenes =[];

  getUserOrder() async{
    var token = await _getToken();
    var response = await http.get(Uri.parse(lista._url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer '+token
      },
    );
    var jsonData =jsonDecode(response.body);
    //print(jsonData);

    for(var u in jsonData){
      Map orden =
      {
        "id": u["id"],
        "consignee": u["consignee"],
        "carrier": u["carrier"],
        "shipper": u["shipper"],
        "total_price": u["total_price"],
        "purchase_detail": u["purchase_detail"],
        "status": u["status"],
      };
      ordenes.add(orden);
    }
    setState(() {

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserOrder();
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
            children: [
              CustomPaint(
                painter: _HeaderWavePainter(),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: SvgPicture.asset('assets/svg/slide4.svg'),
                  ),
                ),
              Text('Pedidos', style: TextStyle(fontSize: 30),),
              SizedBox( height: 12,),
              Text('Total: ' + ordenes.length.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15),),
              SizedBox( height: 12,),
              _createDataTable()
            ],
          ),
      ],
    );
  }

  _createDataTable() {
    if (ordenes.isEmpty) {
      return Text('Sin pedidos hasta el momento',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 15),);
    }
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Expanded(
              child: Text(
                'Order Code',
                textAlign: TextAlign.center,
              ))),
      DataColumn(
          label: Expanded(
              child: Text(
                'Status',
                textAlign: TextAlign.center,
              ))),
      DataColumn(
          label: Expanded(
              child: Text(
                'Carrier',
                textAlign: TextAlign.center,
              )))
    ];
  }

  List<DataRow> _createRows()  {
    return ordenes
        .map((orden) => DataRow(cells: [
      DataCell( Center(child: Text(orden['id'].toString()))),
      DataCell( Center(child: Text(orden['status'].toString()))),
      DataCell( Center(child: Text(orden['carrier'].toString())), onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ruta_pedido(order: orden)),
        );
      } )
    ]))
        .toList();
  }
}



class _HeaderWavePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();

    // Propiedades
    lapiz.color = Colors.orange;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;

    var path = Path();
    path.lineTo(0.0, size.height - 10);

    var secondControlPoint =
    Offset(size.width - (size.width/3), size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 10);
    path.lineTo(size.width, 0.0);
    path.close();

    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
class Ordenes{
  final int id; String status; String order;
  Ordenes(this.id,this.status,this.order);
}