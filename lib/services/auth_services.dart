import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _apiKey = 'AIzaSyAWFj9Rxn7ZiYS9Snm-Sbqw_TKETgYSA_U';

  final storage = FlutterSecureStorage();

  Future CreateUser(String email, String password) async {
    //Datos del usuario que se envaran a firebase
    //Para crear al usuario
    Map<String, dynamic> authData = {'email': email, 'password': password};

    //Url de firebase para poder enviar los datos
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _apiKey});

    //Enviamos la data codificada por medio del Url
    final resp = await http.post(url, body: json.encode(authData));

    //Decodificamos la respuesta para saber si obtenemos el token
    //del usuario
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    //Si al registrarnos obtenemos un idToken retornara null
    //Si el usuario ya esta registrado retornara un error
    if (decodeResp.containsKey('idToken')) {
      User? user = FirebaseAuth.instance.currentUser;

         await FirebaseFirestore.instance
            .collection("users")
            .doc(user?.uid)
            .set({
          'uid': user?.uid,
        });
      //Si obtenemos el idToken
      //Guardamos el token en el storage
      /* await storage.write(key: 'key', value: decodeResp['isToken']); */
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future LoginUser(String email, String password) async {
    //Datos del usuario que se envaran a firebase
    //Para crear al usuario
    Map<String, dynamic> authData = {'email': email, 'password': password};

    //Url de firebase para poder enviar los datos
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _apiKey});

    //Enviamos la data codificada por medio del Url
    final resp = await http.post(url, body: json.encode(authData));

    //Decodificamos la respuesta para saber si obtenemos el token
    //del usuario
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    //Si al registrarnos obtenemos un idToken retornara null
    //Si el usuario ya esta registrado retornara un error
    if (decodeResp.containsKey('idToken')) {
      //Si obtenemos el idToken
      //Guardamos el token en el storage
      await storage.write(key: 'token', value: decodeResp['idToken']);
      
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  //Cerrar sesion
  Future logOut() async {
    //Debemos destruir el token al cerrar sesion
    await storage.delete(key: 'token');
  }

  //Metodo para leer el token(si existe) del firebase storage
  Future<String> readToken() async {
    //Si no existe el token
    return await storage.read(key: 'token') ?? '';
  }
}
