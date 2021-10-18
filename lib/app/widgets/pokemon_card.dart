import 'package:flutter/material.dart';
import 'package:pokemon_app/constants.dart';

class PokemonCard extends StatelessWidget {
  final dynamic pokemon;
  const PokemonCard({required this.pokemon, Key? key}) : super(key: key);

  static const TextStyle style = TextStyle(
    color: AppColors.white,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.dark,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'ID: #${pokemon.id}',
            style: style,
          ),
          CircleAvatar(
            radius: 120,
            backgroundColor: AppColors.white,
            child: Image.network(
              pokemon.sprites.frontDefault,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Name: ${pokemon.name.replaceFirst(pokemon.name[0], pokemon.name[0].toUpperCase())}',
            style: const TextStyle(color: AppColors.yellow, fontSize: 25),
          ),
          Text(
            'Height: ${pokemon.height}',
            style: style,
          ),
          Text(
            'Weight: ${pokemon.weight}',
            style: style,
          ),
        ],
      ),
    );
  }
}
