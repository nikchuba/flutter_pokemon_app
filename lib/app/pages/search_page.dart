import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app/widgets/pokemon_bloc_builder.dart';
import 'package:pokemon_app/app/widgets/search_input.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/services/pokemon_repository.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final pokemonRepository = PokemonRepository();
  final String name = 'SearchPage';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.1;
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
            const Text('Search'),
          ],
        ),
      ),
      body: BlocProvider<PokemonBloc>(
        create: (context) => PokemonBloc(pokemonRepository: pokemonRepository),
        child: ListView(
          children: [
            Column(
              children: [
                const SearchInput(),
                SizedBox(
                  height: height,
                ),
                PokemonBlocBuilder(parent: name),
              ],
            )
          ],
        ),
      ),
    );
  }
}
