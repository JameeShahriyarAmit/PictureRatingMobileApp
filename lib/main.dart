//! This file is fully given. Do nothing on it.

import 'package:final_exam/screens/photo_screen.dart';
import 'package:flutter/material.dart';

import 'dependencies.dart' as di;
import 'screens/photolist_screen.dart';
// import 'screens/photo_screen.dart';

void main() {
  di.init();
  runApp(MaterialApp(
    title: 'Final Exam',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.pink),
    home: PhotolistScreen(),
    // home:PhotoScreen(), // This line is just for providing you to open the second screen. Remove this line later.
  ));
}
