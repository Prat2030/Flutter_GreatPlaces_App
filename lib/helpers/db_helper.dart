import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final sqlDb = await sql.openDatabase(
      path.join(await sql.getDatabasesPath(), 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          // 'CREATE TABLE $table(${data.keys.first} TEXT PRIMARY KEY, ${data.keys.last} TEXT)',
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT,)',
        );
      },
      version: 1,
    );
    await sqlDb.insert(
      table,
      data,
      conflictAlgorithm: sql
          .ConflictAlgorithm.replace, // Replace the old data with the new data.
    );
  }
}
