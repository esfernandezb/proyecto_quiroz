import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class lista extends StatelessWidget {

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
              DataTable(
                sortColumnIndex: 2,
                sortAscending: false,
                columns: [
                  DataColumn(label: Text("Orden")),
                  DataColumn(label: Text("Estado")),
                  DataColumn(label: Text("Courier"),),
                ],
                rows: [
                  DataRow(
                      selected: true,
                      cells: [
                        DataCell(Text("001")),
                        DataCell(Text("Completado")),
                        DataCell(Text("AliExpress"))
                      ]),
                  DataRow(cells: [
                    DataCell(Text("002")),
                    DataCell(Text("Pendiente")),
                    DataCell(Text("Amazon"))
                  ]),
                  DataRow(
                      cells: [
                        DataCell(Text("003")),
                        DataCell(Text("Completado")),
                        DataCell(Text("AliExpress"))
                      ]),
                  DataRow(cells: [
                    DataCell(Text("004")),
                    DataCell(Text("Pendiente")),
                    DataCell(Text("Amazon"))
                  ])
                ],
              )
            ],
          ),
      ],
    );
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