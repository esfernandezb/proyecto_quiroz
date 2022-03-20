import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogOut {
  static final String _url = "http://192.168.100.53:8000/api/";

  postData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    var token = await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      headers: {
        'Content-type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer '+token
      },
    );
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token;
  }


}