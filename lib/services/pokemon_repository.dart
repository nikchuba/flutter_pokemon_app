import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/services/pokemon_api_provider.dart';

class PokemonRepository {
  final PokemonProvider _pokemonProvider = PokemonProvider();
  Future<Pokemon> getPokemon(int id) => _pokemonProvider.getPokemon(id);
}
