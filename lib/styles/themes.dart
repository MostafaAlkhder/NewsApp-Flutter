import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class Thmes {
  static ThemeData mainTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.deepOrange,
            statusBarIconBrightness: Brightness.dark),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        elevation: 20.0),
    iconTheme: IconThemeData(color: Colors.black, size: 20),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.deepOrange,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
      scaffoldBackgroundColor: HexColor('333739'),
      appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          backgroundColor: HexColor('333739'),
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: HexColor('333739'),
              statusBarIconBrightness: Brightness.light),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 20.0,
          backgroundColor: HexColor('333739'),
          unselectedItemColor: Colors.grey),
      iconTheme: IconThemeData(color: Colors.white, size: 20),
      textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.white)));
}
