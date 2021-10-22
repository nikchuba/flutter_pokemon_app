import 'package:flutter/material.dart';
import 'package:pokemon_app/constants.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback callback;
  const SearchButton(this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 40,
      splashColor: AppColors.yellow,
      highlightColor: AppColors.yellow,
      color: AppColors.yellow,
      onPressed: callback,
      icon: const Icon(Icons.search_rounded),
    );
  }
}
