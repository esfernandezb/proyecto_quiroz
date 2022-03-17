import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarea4/src/ruta_pedido.dart';
import '../services/orders-api.dart';
import 'home.dart';
import 'lista.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;


class pedido extends StatefulWidget {
  @override
  _pedidoState createState() => _pedidoState();
}

class _pedidoState extends State<pedido> {

  TextEditingController _shipper = TextEditingController();
  TextEditingController _consignee = TextEditingController();
  TextEditingController _carrier = TextEditingController();
  TextEditingController _total_price = TextEditingController();
  TextEditingController _purchase_detail = TextEditingController();
  TextEditingController _order_date = TextEditingController();
  var img;
  static final String _url = "http://192.168.1.10:8000/api/order";


  final _formKey = GlobalKey<FormState>();
  File? _image;


  String? _image64;
  String? base64Image;

  final _picker = ImagePicker();


  String? _path;

  File? selectedImage;
  String? message = "";
  String? date ="";

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
    var token = localStorage.getString('token');
    return token;
  }

  uploadImage() async{
      if(selectedImage == null){
        _showMsgError('Agregue la imagen de su factura');
      };
      var token = await _getToken();
      final request = http.MultipartRequest("POST",Uri.parse(_url));
      final headers = {'Content-type': 'multipart/form-data',
                       'Accept': 'application/json',
                       'Authorization': 'Bearer '+token
                      };
      request.fields['shipper'] = _shipper.text;
      request.fields['consignee']=_consignee.text;
      request.fields['carrier']= _carrier.text;
      request.fields['total_price']= _total_price.text;
      request.fields['purchase_detail'] = _purchase_detail.text;
      request.fields['order_date']= selectedDate.toString();
      request.files.add(

        http.MultipartFile('invoice_file', selectedImage!.readAsBytes().asStream(),selectedImage!.lengthSync(),
            filename:selectedImage!.path.split("/").last));
      request.headers.addAll(headers);
      final response = await request.send();
      http.Response res = await http.Response.fromStream(response);
      final resJson = jsonDecode(res.body);
      message = resJson['message'];

      //print(resJson);

      if(resJson['message'] != 'Order created successfully'){
        _showMsgError('Error al agregar producto');
      } else{
        _showMsg('Orden generada con éxito');
        print("+-----------------------+");
        print("Orden Generada con éxito");
        print("+-----------------------+");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
      setState(() {

      });

  }


  Future<void> _openCameraPicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
      //encoding 64
      var bytes = File(selectedImage!.path).readAsBytesSync();
      base64Image = base64Encode(bytes);
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(

        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }

  }


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
                key: _formKey,
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                                RaisedButton(
                                  onPressed: () => _selectDate(context),
                                  color: Colors.deepOrange[400],
                                  textColor: Colors.white,
                                  child: Text('Select date'),


                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
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
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              maxLength: 30,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese los datos';
                                }
                              },
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller:_consignee,
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
                        padding: const EdgeInsets.all(5.0),
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
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              maxLength: 20,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese los datos';
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller: _carrier,
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
                        padding: const EdgeInsets.all(5.0),
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
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              maxLength: 20,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese los datos ';
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller: _shipper,
                              decoration: InputDecoration(
                                hintText: 'Shipper',
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
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
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              maxLength: 5,
                              validator: (value){
                                final intNumber = int.tryParse(value!);
                                if (intNumber != null && intNumber <= 999999){
                                  return null;
                                }
                                else{
                                  return 'Por favor ingrese el valor de la compra';
                                }
                              },
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              controller: _total_price,
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
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height:400,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                           padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.deepOrange[400],),
                                      child: const Text('Selecciona una imagen'),
                                      onPressed: _openImagePicker,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrange[400],),
                                      child: const Text('Toma una imagen'),
                                      onPressed: _openCameraPicker,
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 300,
                                  color: Colors.grey[300],
                                  child: selectedImage != null
                                      ? Image.file(selectedImage!, fit: BoxFit.cover)
                                      : const Text('Selecciona Factura'),
                                )
                              ],
                            ),
                          ),
                        ),
                     ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
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
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              maxLength: 20,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Por favor ingrese los datos';
                                }
                              },
                              style: TextStyle(color: Colors.black,
                                  fontSize: 16),
                              keyboardType: TextInputType.text,
                              controller: _purchase_detail,
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
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                            disabledColor: Colors.orange,
                            child: Text("Agregar Pedido", style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),),
                            splashColor: Colors.orange,
                            color: Colors.orange,
                            onPressed: () {
                              uploadImage();
                            if (_formKey.currentState!.validate()) {
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

