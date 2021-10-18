import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_event.dart';
import 'package:pokemon_app/constants.dart';

class SearchButton extends StatelessWidget {
  final TextEditingController controller;
  const SearchButton({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    return IconButton(
      iconSize: 40,
      splashColor: AppColors.yellow,
      highlightColor: AppColors.yellow,
      color: AppColors.yellow,
      onPressed: () {
        LoadPokemonByNameEvent.name = controller.text;
        pokemonBloc.add(LoadPokemonByNameEvent());
        controller.text = '';
      },
      icon: const Icon(Icons.search_rounded),
    );
  }
}
