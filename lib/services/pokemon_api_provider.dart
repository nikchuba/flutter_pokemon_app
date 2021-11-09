import 'package:dio/dio.dart';
import 'package:pokemon_app/db_helper.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonProvider {
  final DBHelper dbHelper = DBHelper();
  String errorMsg = 'Error fetching pokemon';

  Future<Response> fetchPokemonByParam(dynamic param) async {
    return await Dio().get('https://pokeapi.co/api/v2/pokemon/$param/');
  }

  Future<dynamic> getPokemonById(int id) async {
    try {
      Response response = await fetchPokemonByParam(id);
      Pokemon pokemon = Pokemon.fromJson(response.data);
      await dbHelper.insert(pokemon);
      return pokemon;
    } on DioError catch (_) {
      return null;
    }
  }

  Future<dynamic> getPokemonByName(String name) async {
    dynamic responseDB = await dbHelper.getPokemonByName(name);
    if (responseDB is Pokemon) {
      return responseDB;
    } else if (!responseDB) {
      try {
        Response response = await fetchPokemonByParam(name);
        Pokemon pokemon = Pokemon.fromJson(response.data);
        await dbHelper.insert(pokemon);
        return pokemon;
      } on DioError catch (e) {
        if (e.response != null) {
          return true;
        } else {
          return false;
        }
      }
    }
  }
}
