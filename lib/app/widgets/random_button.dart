import 'package:flutter/material.dart';
import 'package:pokemon_app/constants.dart';

class RandomButton extends StatelessWidget {
  final void Function(BuildContext) callback;
  const RandomButton(this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      onPressed: () => callback(context),
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
