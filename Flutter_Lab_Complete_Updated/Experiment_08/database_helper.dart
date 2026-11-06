import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? database;

  static Future<Database> getDatabase() async {
    if (database != null) return database!;

    final path = join(await getDatabasesPath(), 'students.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, course TEXT)',
        );
      },
    );
    return database!;
  }

  static Future<void> insertStudent(String name, String course) async {
    final db = await getDatabase();
    await db.insert('students', {'name': name, 'course': course});
  }

  static Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await getDatabase();
    return db.query('students');
  }

  static Future<void> deleteStudent(int id) async {
    final db = await getDatabase();
    await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
