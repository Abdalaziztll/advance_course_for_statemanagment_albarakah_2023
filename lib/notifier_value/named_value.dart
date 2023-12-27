import 'package:flutter/material.dart';

class NamedValue extends ValueNotifier<String>{
  NamedValue(super.value);


  // NamedValue name = NamedValue('hello');

  void changeName(String name){
    value=name;
    notifyListeners();
  }

}