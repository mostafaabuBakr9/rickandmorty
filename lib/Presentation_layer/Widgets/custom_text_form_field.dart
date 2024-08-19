import 'package:flutter/material.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';

class CustomTextFormField extends StatefulWidget {
  final List<Character> allChaeacters;
  CustomTextFormField({super.key, required this.allChaeacters});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TextEditingController searchtextcontroller = TextEditingController();

  List<Character> searchChaeacters = [];

  bool issearching = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchtextcontroller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Find A Character ...',
        border: InputBorder.none,
      ),
      onChanged: (value) {
        searchForItems(value);
      },
    );
  }

  void searchForItems(String value) {
    searchChaeacters = widget.allChaeacters
        .where(
          (character) => character.name.toLowerCase().contains(value),
        )
        .toList();
    setState(() {});
  }
}
