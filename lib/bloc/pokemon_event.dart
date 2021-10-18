abstract class PokemonEvent {}

class LoadRandomPokemonEvent extends PokemonEvent {}

class LoadPokemonByNameEvent extends PokemonEvent {
  static String? pokemonName;
  static set name(String text) => pokemonName = text;
}
