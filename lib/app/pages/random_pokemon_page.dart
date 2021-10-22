import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app/widgets/pokemon_bloc_builder.dart';
import 'package:pokemon_app/app/widgets/random_button.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_event.dart';
import 'package:pokemon_app/constants.dart';
import 'package:pokemon_app/services/pokemon_repository.dart';

class RandomPokemonPage extends StatelessWidget {
  RandomPokemonPage({Key? key}) : super(key: key);
  final pokemonRepository = PokemonRepository();
  final String name = 'RandomPokemonPage';
  static callback(BuildContext context) {
    BlocProvider.of<PokemonBloc>(context).add(LoadRandomPokemonEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 25,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('${texts["randomPage"]}'),
          ],
        ),
      ),
      body: BlocProvider<PokemonBloc>(
        create: (context) => PokemonBloc(pokemonRepository: pokemonRepository),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PokemonBlocBuilder(parent: name),
              const RandomButton(callback),
            ],
          ),
        ),
      ),
    );
  }
}
