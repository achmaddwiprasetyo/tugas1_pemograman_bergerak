import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import '../models/password_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'passwords.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE passwords (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            account TEXT,
            username TEXT,
            password TEXT,
            category TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertPassword(PasswordModel password) async {
    final db = await database;
    return await db.insert('passwords', password.toMap());
  }

  Future<List<PasswordModel>> getPasswords([String? query]) async {
    final db = await database;
    final result = query == null || query.isEmpty
        ? await db.query('passwords')
        : await db.query(
            'passwords',
            where: 'account LIKE ? OR username LIKE ? OR category LIKE ?',
            whereArgs: ['%$query%', '%$query%', '%$query%'],
          );
    return result.map((e) => PasswordModel.fromMap(e)).toList();
  }

  Future<int> updatePassword(PasswordModel password) async {
    final db = await database;
    return await db.update(
      'passwords',
      password.toMap(),
      where: 'id = ?',
      whereArgs: [password.id],
    );
  }

  Future<int> deletePassword(int id) async {
    final db = await database;
    return await db.delete('passwords', where: 'id = ?', whereArgs: [id]);
  }
}
