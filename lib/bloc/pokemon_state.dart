import 'package:flutter/foundation.dart';

abstract class PokemonState {}

class PokemonEmptyState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  dynamic pokemon;
  PokemonLoadedState({@required this.pokemon}) : assert(pokemon != null);
}

class PokemonErrorState extends PokemonState {}
