import 'package:bmicalclutor/newsapp/pages/businessScreen.dart';
import 'package:bmicalclutor/newsapp/pages/scienceScreen.dart';
import 'package:bmicalclutor/newsapp/pages/settings/settingsScreen.dart';
import 'package:bmicalclutor/newsapp/pages/sportsScreen.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
  BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
  BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
];
List<Widget> screens = [
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
];
