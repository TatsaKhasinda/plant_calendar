import 'package:plant_calendar/models/event.dart';
import 'package:sqflite/sqflite.dart';

class dbHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "event";

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }
    try {
      // ignore: prefer_interpolation_to_compose_strings
      String path = await getDatabasesPath() + 'event_db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "plant STRING, note TEXT, date STRING, startTime STRING, endTime STRING,"
              "repeat STRING, ket TEXT, isCompleted INTEGER)");
        },
      );
    } catch (e) {}
  }

  static Future<int> insert(Event? event) async {
    await initDB();
    return await _db?.insert(_tableName, event!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    await initDB();
    return await _db!.query(_tableName);
  }

  static delete(Event event) async {
    await initDB();
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [event.id]);
  }

  static update(int id) async {
    await initDB();
    _db!.rawUpdate('''
    UPDATE $_tableName
    SET isCompleted = ?
    WHERE id = ?''', [1, id]);
  }
}
