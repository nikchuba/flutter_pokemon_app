import 'package:dio/dio.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonProvider {
  Future<Pokemon> getPokemon(int id) async {
    Response response = await Dio().get(
      'https://pokeapi.co/api/v2/pokemon/$id/',
    );

    if (response.statusCode == 200) {
      Pokemon pokemon = Pokemon.fromJson(response.data);
      return pokemon;
    } else {
      throw Exception('Error fetching users');
    }
  }
}
