import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderApi{
  static final String _url = "http://192.168.100.53:8000/api/";

  postImageData(data, apiUrl) async {
    var fullUrl= _url+apiUrl;
    var token = await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      body:jsonEncode(data),
      headers: {
        'Content-type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer '+token
      },
    );
  }

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token;
  }


}