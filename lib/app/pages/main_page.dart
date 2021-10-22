import 'package:flutter/material.dart';
import 'package:pokemon_app/constants.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Size btnSize = Size(286, 70);
    const TextStyle style = TextStyle(fontSize: 48);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/crown.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => {
                Navigator.pushNamed(context, '/search'),
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
                fixedSize: MaterialStateProperty.all(btnSize),
                backgroundColor: MaterialStateProperty.all(AppColors.red),
              ),
              child: Text('${texts["searchBtn"]}', style: style),
            ),
            Container(
              color: AppColors.dark,
              height: 8,
              width: 286,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.pushNamed(context, '/random_pokemon'),
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                ),
                overlayColor:
                    MaterialStateProperty.all(AppColors.red.withAlpha(50)),
                fixedSize: MaterialStateProperty.all(btnSize),
                backgroundColor: MaterialStateProperty.all(AppColors.white),
                foregroundColor: MaterialStateProperty.all(AppColors.dark),
              ),
              child: Text('${texts["randomBtn"]}', style: style),
            ),
          ],
        ),
      ),
    );
  }
}
