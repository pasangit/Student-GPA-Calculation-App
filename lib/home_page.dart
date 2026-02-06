import 'package:flutter/material.dart';
import 'main.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double calculateGPA() {
    double totalPoints = 0;
    int totalCredits = 0;

    for (var s in subjects) {
      totalPoints += s.gradePoint * s.credits;
      totalCredits += s.credits;
    }
    return totalCredits == 0 ? 0 : totalPoints / totalCredits;
  }

  Widget subjectCard(Subject s) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: const Icon(Icons.book, color: Color(0xff2563EB)),
        title: Text(s.name),
        subtitle: Text("Credits: ${s.credits} | Grade: ${s.gradePoint}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double gpa = calculateGPA();

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xff2563EB),
        title: const Text("GPA Calculator"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Clear for next student",
            onPressed: () {
              setState(() {
                subjects.clear();
              });
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Student Info
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Color(0xff2563EB)),
                  title: Text(studentName),
                  subtitle: Text("$regNumber\n$selectedYear - $selectedSemester"),
                ),
              ),
              const SizedBox(height: 20),
              // GPA Display
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(Icons.school, size: 50, color: Color(0xff2563EB)),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Current GPA",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            gpa.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Add Subject Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2563EB),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text("ADD SUBJECT"),
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/add');
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Subjects List
              subjects.isEmpty
                  ? const Center(child: Text("No subjects added"))
                  : Column(
                      children: subjects.map((s) => subjectCard(s)).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
