import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_app/app/widgets/search_button.dart';
import 'package:pokemon_app/constants.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController controller = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            // ignore: unnecessary_string_escapes
            RegExp("\^\[A-Za-z-\]+\$"),
            replacementString: controller.text,
          ),
        ],
        controller: controller,
        onChanged: (value) {
          (value.length >= 2)
              ? setState(() {
                  _isValid = true;
                })
              : setState(() {
                  _isValid = false;
                });
          final trimVal = value.trim();
          (value != trimVal)
              ? setState(() {
                  controller.text = trimVal;
                  controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: trimVal.length));
                })
              : null;
        },
        cursorColor: AppColors.white,
        cursorHeight: 22,
        style: const TextStyle(color: AppColors.yellow, fontSize: 20),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: "Enter name of Pokemon",
          hintStyle: TextStyle(color: AppColors.yellow.withAlpha(200)),
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
          suffixIcon: _isValid ? SearchButton(controller: controller) : null,
        ),
      ),
    );
  }
}
