import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_event.dart';
import 'package:pokemon_app/bloc/pokemon_state.dart';
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
    if (event is LoadRandomPokemonEvent) {
      yield PokemonLoadingState();
      try {
        final Pokemon _loadedPokemon =
            await pokemonRepository!.getRandomPokemon();
        yield PokemonLoadedState(pokemon: _loadedPokemon);
      } on DioError catch (_) {
        yield PokemonErrorState();
      }
    }
    if (event is LoadPokemonByNameEvent) {
      yield PokemonLoadingState();
      try {
        final Pokemon _loadedPokemon = await pokemonRepository!
            .getPokemonByName(LoadPokemonByNameEvent.pokemonName!);
        yield PokemonLoadedState(pokemon: _loadedPokemon);
      } on DioError catch (e) {
        if (e.response != null) {
          PokemonNotFoundState.name = LoadPokemonByNameEvent.pokemonName!;
          yield PokemonNotFoundState();
        } else {
          yield PokemonErrorState();
        }
      }
    }
  }
}
