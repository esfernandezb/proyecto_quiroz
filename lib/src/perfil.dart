import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/sessions.dart';
import 'intro.dart';

class perfil extends StatefulWidget {

  const perfil({Key? key}) : super(key: key);

  @override
  State<perfil> createState() => _perfilState();
}

class _perfilState extends State<perfil> {
  String? first_name = "";

  String? last_name="";

  String? citizen_card ="";

  String? email="";

  _logout() async{
    var res = await LogOut().postData('logout');
    var body = res.body;
    //print(body);
    print("+--------------------------+");
    print("Cierre de sesión, con éxito");
    print("+--------------------------+");
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.clear();
  }

  Future<void> mostrar_datos() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    first_name = (await localStorage.get('first_name')) as String?;
    last_name = (await localStorage.get('last_name')) as String?;
    citizen_card = (await localStorage.get('citizen_card')) as String?;
    email = (await localStorage.get('email')) as String?;
    setState(() {

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostrar_datos();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(20),
        width:double.infinity,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(0, 2),
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(0.5),
                  width: 230.0,
                  height: 230.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage(
                              "assets/jpg/dabf.png")
                      )
                  )
              ),

              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 15),
                  Text(first_name!+' '+last_name!),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.credit_card_sharp),
                  SizedBox(width: 15),
                  Text(citizen_card!),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.mail),
                  SizedBox(width: 15),
                  Text(email!),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Icon(Icons.calendar_today_outlined),
                  SizedBox(width: 15),
                  Text('Se unió en el 2022'),
                ],
              ),
              SizedBox(height: 20),
              RaisedButton(shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
                disabledColor: Colors.orange,
                child: Text("Log out", style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
                splashColor: Colors.orange,
                color: Colors.orange,
                onPressed: () {
                  _logout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => intro()),
                  );

                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}