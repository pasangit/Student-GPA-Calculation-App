import 'package:flutter/material.dart';


List<Subject> subjects = [];

void main() {
  runApp(const GPAApp());
}

class GPAApp extends StatelessWidget {
  const GPAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA Calculator',
      theme: ThemeData(
        primaryColor: const Color(0xff2563EB),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StudentPage(),
        '/home': (context) => HomePage(),
        '/add': (context) => AddSubjectPage(),
      },
    );
  }
}
