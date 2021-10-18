abstract class PokemonState {}

class PokemonEmptyState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  dynamic pokemon;
  PokemonLoadedState({required this.pokemon}) : assert(pokemon != null);
}

class PokemonNotFoundState extends PokemonState {
  static String? pokemonName;
  static set name(String text) => pokemonName = text;
}

class PokemonErrorState extends PokemonState {}
