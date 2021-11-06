import 'package:pokemon_app/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'pokemones.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE pokemones (
          id INTEGER PRIMARY KEY, 
          name TEXT, 
          height INTEGER, 
          weight INTEGER
        );""");
  }

  Future<void> insert(Pokemon pokemon) async {
    Database? dbClient = await db;
    try {
      await dbClient?.rawInsert(
          """INSERT INTO pokemones (id, name, height, weight) VALUES (
        '${pokemon.id}', '${pokemon.name}', '${pokemon.height}', '${pokemon.weight}'
      )""");

      await dbClient?.execute("""CREATE TABLE ${pokemon.name} (
        url TEXT,
        name TEXT
      )""");

      for (var i = 0; i < pokemon.sprites!.list.length; i++) {
        dbClient?.rawInsert("""INSERT INTO ${pokemon.name} (url, name) VALUES (
          '${pokemon.sprites!.list[i]["url"]}',
          '${pokemon.sprites!.list[i]["name"].toString().replaceAll(' ', '_')}'
        )""");
      }
    } on DatabaseException catch (_) {}
  }

  Future<dynamic> getPokemonByName(String name) async {
    Database? dbClient = await db;

    try {
      dynamic pokeRes = await dbClient
          ?.rawQuery('SELECT * FROM pokemones WHERE name = "$name"');
      dynamic spritesRes = await dbClient?.rawQuery('SELECT * FROM $name');
      List<dynamic> list = [];
      list = spritesRes;
      Map<String, dynamic> sprites = {};
      for (var item in list) {
        sprites['${item["name"]}'] = item['url'];
      }
      Map<String, dynamic> poke = {};
      poke.addAll(pokeRes[0]);
      poke['sprites'] = sprites;
      print(sprites);
      Pokemon pokemon = Pokemon.fromJson(poke);

      return pokemon;
    } on DatabaseException catch (_) {
      return null;
    }
  }
}
