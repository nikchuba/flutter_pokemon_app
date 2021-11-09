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
    String insertPokemon =
        "INSERT INTO pokemones (id, name, height, weight) VALUES ('${pokemon.id}', '${pokemon.name}', '${pokemon.height}', '${pokemon.weight}')";
    String queryCreateTable =
        "CREATE TABLE ${pokemon.name} (url TEXT, name TEXT)";

    try {
      await dbClient?.rawInsert(insertPokemon);

      await dbClient?.execute(queryCreateTable);

      for (var i = 0; i < pokemon.sprites!.list.length; i++) {
        String insertSprites =
            "INSERT INTO ${pokemon.name} (url, name) VALUES ('${pokemon.sprites!.list[i]["url"]}', '${pokemon.sprites!.list[i]["name"]}')";
        dbClient?.rawInsert(insertSprites);
      }
    } on DatabaseException catch (_) {}
  }

  Future<dynamic> getPokemonByName(String name) async {
    Database? dbClient = await db;
    List<dynamic> list = [];
    Map<String, dynamic> poke = {};

    String queryPokemon = 'SELECT * FROM pokemones WHERE name = "$name"';
    String querySprites = 'SELECT * FROM $name';

    try {
      dynamic pokeRes = await dbClient?.rawQuery(queryPokemon);
      dynamic spritesRes = await dbClient?.rawQuery(querySprites);

      list = spritesRes;
      Map<String, dynamic> sprites = {};
      for (var item in list) {
        sprites['${item["name"]}'] = item['url'];
      }
      poke.addAll(pokeRes[0]);
      poke['sprites'] = sprites;
      Pokemon pokemon = Pokemon.fromJson(poke);

      return pokemon;
    } on DatabaseException catch (_) {
      return false;
    }
  }
}
