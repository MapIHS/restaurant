import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/restaurant_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'restaurant.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id TEXT PRIMARY KEY, name TEXT, description TEXT, pictureId TEXT, city TEXT, rating REAL)',
        );
      },
    );
  }

  Future<void> insertFavorite(RestaurantModel restaurant) async {
    final db = await database;
    await db.insert(
      'favorites',
      restaurant.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<RestaurantModel>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return List.generate(maps.length, (i) {
      return RestaurantModel.fromJson(maps[i]);
    });
  }

  Future<void> deleteFavorite(String id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
