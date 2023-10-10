import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modules10/HomeScreen.dart';

void main(){
  runApp(Todo());
}

class Todo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
   debugShowCheckedModeBanner: false,
   home: HomeScreen(),);
  }

}