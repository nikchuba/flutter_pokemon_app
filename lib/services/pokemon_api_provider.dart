import 'package:dio/dio.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonProvider {
  Future<dynamic> getPokemonById(int id) async {
    try {
      Response response = await Dio().get(
        'https://pokeapi.co/api/v2/pokemon/$id/',
      );
      Pokemon pokemon = Pokemon.fromJson(response.data);
      return pokemon;
    } on DioError catch (_) {
      return null;
    }
  }

  Future<Pokemon> getPokemonByName(String name) async {
    Response response = await Dio().get(
      'https://pokeapi.co/api/v2/pokemon/$name/',
    );

    if (response.statusCode == 200) {
      Pokemon pokemon = Pokemon.fromJson(response.data);
      return pokemon;
    } else {
      throw Exception('Error fetching pokemon');
    }
  }
}
