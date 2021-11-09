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
      final dynamic _loadedPokemon =
          await pokemonRepository!.getRandomPokemon();

      if (_loadedPokemon is Pokemon) {
        yield PokemonLoadedState(pokemon: _loadedPokemon);
      } else {
        yield PokemonErrorState();
      }
    }

    if (event is LoadPokemonByNameEvent) {
      yield PokemonLoadingState();
      final dynamic _loadedPokemon = await pokemonRepository!
          .getPokemonByName(LoadPokemonByNameEvent.pokemonName!);

      if (_loadedPokemon is Pokemon) {
        yield PokemonLoadedState(pokemon: _loadedPokemon);
      } else if (_loadedPokemon) {
        PokemonNotFoundState.name = LoadPokemonByNameEvent.pokemonName!;
        yield PokemonNotFoundState();
      } else {
        yield PokemonErrorState();
      }
    }
  }
}
