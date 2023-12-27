import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int value = 0;


 void increament(){
    value++;
    notifyListeners();
  }

 void decreament(){
    value--;
    notifyListeners();
  }
}