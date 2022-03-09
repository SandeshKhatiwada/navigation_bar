import 'package:flutter/material.dart';
import 'package:navigation_bar/register_page.dart';
import 'home_page.dart';
import 'login_page.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,

    ),
    debugShowCheckedModeBanner: false,
      title: "NavigationBar",

    home: HomePage(),

    initialRoute: 'home',
    routes: {
      'home': (context) =>HomePage(),
      'login' : (context) =>LoginPage(),
      'register' : (context)=>RegisterPage(),
    }
  ));
}



