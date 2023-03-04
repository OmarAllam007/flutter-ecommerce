import 'package:path/path.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/models/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    // String path = join(await getDatabasesPath(), 'CartDb.db');
    // deleteDatabase(path);
    if (_database != null) return _database;

    _database = await initDb();

    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartDb.db');
    // deleteDatabase(path);

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''  CREATE TABLE $tableCartProduct (
      $columnProductId TEXT NOT NULL,
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL) ''');
    });
  }

  Future<List<CartProductModel>> getAllProducts() async {
    var dbClient = await database;

    List<Map> maps = await dbClient!.query(tableCartProduct);

    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient
        ?.insert(
          tableCartProduct,
          model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .whenComplete(() => {print("completed")});
  }

  update(CartProductModel model) async {
    var dbClient = await database;
    await dbClient?.update(tableCartProduct, model.toJson(),
        where: '$columnProductId = ?', whereArgs: [model.productId]);
  }
}
