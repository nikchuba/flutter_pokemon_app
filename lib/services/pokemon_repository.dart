import 'package:pokemon_app/constants.dart';
import 'package:pokemon_app/services/pokemon_api_provider.dart';

class PokemonRepository {
  final PokemonProvider _pokemonProvider = PokemonProvider();

  Future<dynamic> getRandomPokemon() =>
      _pokemonProvider.getPokemonById(getRandomInt(1, 898));
  Future<dynamic> getPokemonByName(String name) =>
      _pokemonProvider.getPokemonByName(name);
}
