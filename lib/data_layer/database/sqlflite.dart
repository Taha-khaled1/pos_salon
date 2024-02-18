// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'ecommerce.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 10, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    // await db.execute('ALTER TABLE notes ADD COLUMN color TEXT');
  }

  _onCreate(Database db, int version) async {
    // طريقة الباتش هتكون افضل طريقه تجعلك تضيف اكتر من جدول او تعمل اكتر من عمليه ف نفس الوقت
    Batch batch = db.batch();

    batch.execute('''
    CREATE TABLE favorite (
    "id" INTEGER  NOT NULL PRIMARY KEY,
    "idProduct" INTEGER(11),
    "title" TEXT(500),
    "titleEn" TEXT(500),
    "des" TEXT(500),
    "price" INTEGER(11),
    "image" TEXT(500)
);
 ''');
    batch.execute('''
    CREATE TABLE services (
    "service_id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
    "employee_name" TEXT (255),
    "time_from" TEXT(255),
    "time_to" TEXT(255)
);
 ''');
    // print(" onCreate =====================================");
    batch.commit();
  }

  // List<Data> test = [];
  // var t = test[0].itemsDiscount;
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  /////////////////////////////////////الدوال الجاهزه
  deleteTable(String tableName) async {
    Database? mydb = await db;
    await mydb!.execute("DROP TABLE IF EXISTS $tableName");
  }

  deleteAllData(String tableName) async {
    Database? mydb = await db;
    int response = await mydb!.delete(tableName);
    return response;
  }

  read(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  update(
    String table,
    Map<String, Object?> values,
    String? where,
  ) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values, where: where);
    return response;
  }

  delete(
    String table,
    String? where,
  ) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: where);
    return response;
  }

///////////////////دالة حذف الداتا بيز كاملا
  fordeletedatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'ecommerce.db');
    await deleteDatabase(path);
    print('done delete');
  }
}
