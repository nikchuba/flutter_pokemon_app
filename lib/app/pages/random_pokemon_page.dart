import 'package:flutter/material.dart';

import '../../constants.dart';

class RandomPokemonPage extends StatelessWidget {
  const RandomPokemonPage({Key? key}) : super(key: key);

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
            const Text('Random'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/egg.png',
              fit: BoxFit.cover,
            ),
            ElevatedButton(
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
              onPressed: () {},
              child: const Text(
                'Random Pokemon',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
