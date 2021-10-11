import 'package:flutter/material.dart';

import '../../constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
            const Text('Search'),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              cursorColor: AppColors.white,
              cursorHeight: 22,
              style: const TextStyle(color: AppColors.yellow, fontSize: 20),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                hintText: "Enter name of Pokemon",
                hintStyle: const TextStyle(color: AppColors.yellowHint),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.yellow,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                filled: true,
                fillColor: AppColors.dark,
                suffixIcon: IconButton(
                  iconSize: 40,
                  color: AppColors.yellow,
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            child: Image.asset(
              'assets/images/pokemon_location.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
