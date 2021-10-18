import 'package:pokemon_app/constants.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/services/pokemon_api_provider.dart';

class PokemonRepository {
  final PokemonProvider _pokemonProvider = PokemonProvider();

  Future<Pokemon> getRandomPokemon() =>
      _pokemonProvider.getPokemonById(getRandomInt(1, 898));
  Future<Pokemon> getPokemonByName(String name) =>
      _pokemonProvider.getPokemonByName(name);
}
