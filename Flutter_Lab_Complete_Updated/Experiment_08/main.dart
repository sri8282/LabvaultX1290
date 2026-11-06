import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final nameController = TextEditingController();
  final courseController = TextEditingController();
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    students = await DatabaseHelper.getStudents();
    setState(() {});
  }

  Future<void> addStudent() async {
    await DatabaseHelper.insertStudent(
      nameController.text,
      courseController.text,
    );
    nameController.clear();
    courseController.clear();
    loadStudents();
  }

  Future<void> deleteStudent(int id) async {
    await DatabaseHelper.deleteStudent(id);
    loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Students')),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: courseController,
            decoration: InputDecoration(labelText: 'Course'),
          ),
          ElevatedButton(
            onPressed: addStudent,
            child: Text('Add Student'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student['name']),
                  subtitle: Text(student['course']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteStudent(student['id']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
