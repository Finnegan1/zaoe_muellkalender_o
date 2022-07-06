import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zaoe_muellkalender/models/abfall_eintrag.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    final String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'abfall_kalender.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE abfall_eintrag (id INTEGER PRIMARY KEY AUTOINCREMENT, datum TEXT NOT NULL, typ TEXT NOT NULL)',
        );
      },
    );
  }

  Future<int> insertAbfallEintrag(AbfallEintarg abfallEintarg) async {
    final Database db = await initializeDB();
    return db.insert('abfall_eintrag', abfallEintarg.toMap());
  }

  Future<int> insertListAbfallEintrag(
      List<AbfallEintarg> abfallEintargList) async {
    final Database db = await initializeDB();
    int result = 0;
    for (AbfallEintarg abfallEintarg in abfallEintargList) {
      result = await db.insert('abfall_eintrag', abfallEintarg.toMap());
    }
    return result;
  }
}
