// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:pos_animal/presentation_layer/screens/home_screen/controller/home_controller.dart';
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
    "image" TEXT (255),
    "title" TEXT (255),
    "price" TEXT (255)
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

class Service {
  final int? id;
  final String? employeeName;
  final String? image;
  final String? title;
  final String? price;

  Service({
    this.id,
    this.employeeName,
    this.image,
    this.title,
    this.price,
  });

// Convert a Service object into a Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'service_id': id,
      'employee_name': employeeName,
      'image': image,
      'title': title,
      'price': price,
    };
  }

  // Convert a Service object into the required JSON format
  Map<String, dynamic> toJson(data) {
    return {
      'service_id': id,
      'employee_name': employeeName,
      'image': image,
      'title': title,
      'price': price,
      'time_from': data,
      'time_to': contime(data),
    };
  }
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'services.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE services (
            service_id INTEGER PRIMARY KEY AUTOINCREMENT,
            employee_name TEXT,
            image TEXT,
            title TEXT,
            price TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertService(Service service) async {
    final db = await database;
    return await db.insert('services', service.toMap());
  }

  Future<List<Service>> getServices() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('services');
    return List.generate(maps.length, (i) {
      return Service(
        id: maps[i]['service_id'],
        employeeName: maps[i]['employee_name'],
        image: maps[i]['image'],
        title: maps[i]['title'],
        price: maps[i]['price'],
      );
    });
  }

  Future<int> updateService(Service service) async {
    final db = await database;
    return await db.update(
      'services',
      service.toMap(),
      where: 'service_id = ?',
      whereArgs: [service.id],
    );
  }

  Future<int> deleteService(int id) async {
    final db = await database;
    return await db.delete(
      'services',
      where: 'service_id = ?',
      whereArgs: [id],
    );
  }
}
