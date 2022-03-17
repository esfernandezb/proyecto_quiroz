import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class lista extends StatefulWidget {

  static final String _url = "http://192.168.1.10:8000/api/order";

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
    print(jsonData);


    for(var u in jsonData){
      Map orden =
      {
        "id": u["id"],
        "status": u["status"],
        "carrier": u["carrier"]
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
              Text('ORDENES', style: TextStyle(fontSize: 30),),

              (ordenes.isEmpty? CircularProgressIndicator():_createDataTable())

            ],
          ),
      ],
    );
  }

  DataTable _createDataTable() {

    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Orden')),
      DataColumn(label: Text('Status')),
      DataColumn(label: Text('Carrier'))
    ];
  }

  List<DataRow> _createRows()  {
    return ordenes
        .map((orden) => DataRow(cells: [
      DataCell(Text('#' + orden['id'].toString())),
      DataCell(Text(orden['status'])),
      DataCell(Text(orden['carrier']))
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