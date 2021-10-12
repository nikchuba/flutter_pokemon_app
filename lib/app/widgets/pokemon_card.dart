import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_state.dart';
import 'package:pokemon_app/constants.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key}) : super(key: key);
  static const TextStyle style = TextStyle(
    color: AppColors.white,
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonEmptyState) {
            return SizedBox(
              width: 300,
              height: 400,
              child: Image.asset(
                'assets/images/egg.png',
                fit: BoxFit.none,
              ),
            );
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
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.dark,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ID: #${state.pokemon.id}',
                    style: style,
                  ),
                  CircleAvatar(
                    radius: 120,
                    backgroundColor: AppColors.white,
                    child: Image.network(
                      state.pokemon.sprites.frontDefault,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'Name: ${state.pokemon.name.replaceFirst(state.pokemon.name[0], state.pokemon.name[0].toUpperCase())}',
                    style:
                        const TextStyle(color: AppColors.yellow, fontSize: 25),
                  ),
                  Text(
                    'Height: ${state.pokemon.height}',
                    style: style,
                  ),
                  Text(
                    'Weight: ${state.pokemon.weight}',
                    style: style,
                  ),
                ],
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
