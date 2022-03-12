//Proveedor de datos

import 'package:flutter/cupertino.dart';

//ChangeNotifier se usa si queremos usar provider o
//redibujar un widget
class LoginFormProvider extends ChangeNotifier {
  //key del login form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool isValidForm() {
    //Imprimimos el estado de los forms (true or false)
    print(formKey.currentState?.validate());
    //Si todos los campos estan llenos dara true, sino false
    //Si el estado actual es valido dara true,
    //caso contrrio sera false
    return formKey.currentState!.validate() ? true : false;
  }
}
