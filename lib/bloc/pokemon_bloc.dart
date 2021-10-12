import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_event.dart';
import 'package:pokemon_app/bloc/pokemon_state.dart';
import 'package:pokemon_app/constants.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/services/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository? pokemonRepository;

  PokemonBloc({this.pokemonRepository})
      : assert(pokemonRepository != null),
        super(PokemonEmptyState());

  PokemonState get initialState => PokemonEmptyState();

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonLoadEvent) {
      yield PokemonLoadingState();
      try {
        final Pokemon _loadedPokemon =
            await pokemonRepository!.getPokemon(getRandomInt(1, 898));
        yield PokemonLoadedState(pokemon: _loadedPokemon);
      } on DioError catch (e) {
        yield PokemonErrorState();
      }
    }
  }
}
