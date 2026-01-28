import 'package:flutter/material.dart';

void main() {
  runApp(const GPAApp());
}

class GPAApp extends StatelessWidget {
  const GPAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA & Attendance Manager',
      theme: ThemeData(primarySwatch: Colors.indigo),
      
      
    );
  }
}