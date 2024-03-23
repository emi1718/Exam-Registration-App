import 'package:erp/screens/STD_Form.dart';
import 'package:erp/screens/STD_LIst.dart';
import 'package:erp/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => home(),
        '/newStd':(context) => form(),
        '/stdList':(context) => list()      
      },
    )           
   );
}
