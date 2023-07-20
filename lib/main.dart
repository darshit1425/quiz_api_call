import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/view/home_screen.dart';


void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomeScreen()
      },
    ),
  );
}