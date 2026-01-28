import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/add_subject_page.dart';
import 'pages/attendance_page.dart';
import 'models/subject.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddSubjectPage(),
        '/attendance': (context) => AttendancePage(),
      },
    );
  }
}

// Shared subject list for simplicity
List<Subject> subjects = [];
