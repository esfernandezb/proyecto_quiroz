
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarea4/src/login.dart';

import '../models/slider_model.dart';

class page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 80,
                ),
                Container(
                height: 450,
                  child: _Slides(),
            ),
                _Dots(),
                RaisedButton(
                  disabledColor: Colors.orangeAccent,
                  color: Colors.orange,
                  child: Text("Let's go!",style: TextStyle(fontSize: 20,color: Colors.white),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                      );
                    }
                )
              ],
            )
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot( this.index );

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration( milliseconds: 200 ),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric( horizontal: 5 ),
      decoration: BoxDecoration(
          color: ( pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5 )
              ? Colors.orange : Colors.grey,
          shape: BoxShape.circle
      ),
    );
  }
}




class _Slides extends StatefulWidget {

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      // print('Página actual: ${ pageViewController.page }');

      // Actualizar el provider, sliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;

    });

  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageViewController,
          children: <Widget>[
          _Slide('assets/svg/slide1.svg','Seleccionar sus productos'),
      _Slide('assets/svg/slide2.svg','Pagar de forma Segura'),
      _Slide('assets/svg/slide3.svg','Control de inicio y fin de la compra'),
      ],
    ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  final String texto;
  _Slide( this.svg, this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          SvgPicture.asset(svg, width:300, height:300,),
          Container(height: 20,),
          Text(texto, style: TextStyle(fontSize: 25, color: Colors.black45),)
        ],
      ),
    );
  }
}
