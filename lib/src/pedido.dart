import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:image_picker/image_picker.dart';


class pedido extends StatefulWidget {
  @override
  _pedidoState createState() => _pedidoState();
}

class _pedidoState extends State<pedido> {

  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker

  Future<void> _openCameraPicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
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
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
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
                                      child: const Text('Selecciona una imagen'),
                                      onPressed: _openImagePicker,
                                    ),
                                    ElevatedButton(
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
                                  child: _image != null
                                      ? Image.file(_image!, fit: BoxFit.cover)
                                      : const Text('Selecciona imagen'),
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
                          padding: const EdgeInsets.all(8.0),
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