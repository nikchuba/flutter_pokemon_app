import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_event.dart';
import 'package:pokemon_app/constants.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size(250, 80),
        ),
        backgroundColor: MaterialStateProperty.all(AppColors.dark),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 4, horizontal: 60),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      onPressed: () {
        pokemonBloc.add(LoadRandomPokemonEvent());
      },
      child: const Text(
        'Random Pokemon',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
