import 'package:flutter/material.dart';
import 'package:pokemon_app/constants.dart';

// ignore: must_be_immutable
class PokemonCard extends StatefulWidget {
  final dynamic pokemon;
  const PokemonCard({required this.pokemon, Key? key}) : super(key: key);

  static const TextStyle style = TextStyle(
    color: AppColors.white,
    fontSize: 20,
  );

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  List<dynamic> validSprites = [];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    validSprites = [];
    for (var sprite in widget.pokemon.sprites.list) {
      if (sprite['url'] != null) {
        validSprites.add(sprite);
      }
    }
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
            'ID: #${widget.pokemon.id}',
            style: PokemonCard.style,
          ),
          SizedBox(
            height: 200,
            width: 230,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: validSprites.length,
              controller: PageController(initialPage: _currentPage),
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 900),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.white,
                    ),
                    child: Image.network(
                      validSprites[index]['url'],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              '${validSprites[_currentPage]["name"]} side:',
              key: ValueKey<int>(_currentPage),
              style: PokemonCard.style,
            ),
          ),
          Text(
            'Name: ${widget.pokemon.name.replaceFirst(widget.pokemon.name[0], widget.pokemon.name[0].toUpperCase())}',
            style: const TextStyle(color: AppColors.yellow, fontSize: 25),
          ),
          Text(
            'Height: ${widget.pokemon.height}',
            style: PokemonCard.style,
          ),
          Text(
            'Weight: ${widget.pokemon.weight}',
            style: PokemonCard.style,
          ),
        ],
      ),
    );
  }
}
