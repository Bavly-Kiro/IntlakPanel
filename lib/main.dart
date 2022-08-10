import 'package:intlakpanel/screens/home-panel-sceen.dart';

import 'package:flutter/material.dart';

void main() {
  //bavly
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePanelScreen(),
    );
  }
}


