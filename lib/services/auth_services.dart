class AuthService with ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _apiKey = 'AIzaSyA-XCaDcpO7BOF8rV7BBeh4JN_NGgRNS0I';

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
