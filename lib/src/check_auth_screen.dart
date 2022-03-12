import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tarea4/src/home.dart';
import 'package:tarea4/src/intro.dart';
import 'package:tarea4/src/login.dart';


import '../services/auth_services.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    0,
                  )),
                  child: SvgPicture.asset(
                    'assets/svg/upsmeetlogo.svg',
                    color: Colors.blue,
                  ),
                ),
              );
            }

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => intro(),
                        transitionDuration: Duration(seconds: 0)));
                /* Navigator.of(context).pushReplacementNamed('home'); */
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Home(),
                        transitionDuration: Duration(seconds: 0)));
                /* Navigator.of(context).pushReplacementNamed('home'); */
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
