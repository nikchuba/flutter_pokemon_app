import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app/widgets/pokemon_card.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_state.dart';
import 'package:pokemon_app/constants.dart';
import 'package:pokemon_app/models/pokemon.dart';

// ignore: must_be_immutable
class PokemonBlocBuilder extends StatelessWidget {
  String? parent;
  PokemonBlocBuilder({required this.parent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonEmptyState) {
            if (parent == 'SearchPage') {
              return SizedBox(
                child: Image.asset(
                  'assets/images/pokemon_location.png',
                  fit: BoxFit.none,
                ),
              );
            }
            if (parent == 'RandomPokemonPage') {
              return SizedBox(
                child: Image.asset(
                  'assets/images/egg.png',
                  fit: BoxFit.none,
                ),
              );
            }
          }
          if (state is PokemonLoadingState) {
            return const Center(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.dark,
                child: CircularProgressIndicator(
                  color: AppColors.yellow,
                ),
              ),
            );
          }
          if (state is PokemonLoadedState) {
            var pokemon = state.pokemon;

            return PokemonCard(
              pokemon: pokemon,
              key: ValueKey<Pokemon>(state.pokemon),
            );
          }
          if (state is PokemonNotFoundState) {
            return Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.red.withAlpha(150),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Text(
                  'Pokemon with name "${PokemonNotFoundState.pokemonName}" was not found',
                  style: const TextStyle(
                    color: AppColors.yellow,
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }
          if (state is PokemonErrorState) {
            return Center(
              child: Image.asset(
                'assets/images/error-404.png',
                height: 270,
                fit: BoxFit.cover,
              ),
            );
          }
          return throw Exception('Error');
        },
      ),
    );
  }
}
