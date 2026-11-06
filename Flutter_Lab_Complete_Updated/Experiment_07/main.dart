import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  String name;
  int age;

  Student(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  Student.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Student> students = [
    Student('Raj', 20),
    Student('Sam', 21),
  ];

  void addStudent() {
    setState(() {
      students.add(Student('New Student', 22));
    });
  }

  @override
  Widget build(BuildContext context) {
    String jsonData = jsonEncode(students[0].toJson());
    Student student = Student.fromJson(jsonDecode(jsonData));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Student List')),
        body: Column(
          children: [
            Text('JSON: ${student.toJson()}'),
            ElevatedButton(
              onPressed: addStudent,
              child: Text('Add Student'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index].name),
                    subtitle: Text('Age: ${students[index].age}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
