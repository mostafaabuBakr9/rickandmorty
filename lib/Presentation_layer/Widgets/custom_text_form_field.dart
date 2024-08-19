import 'package:flutter/material.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';

class CustomTextFormField extends StatefulWidget {
  final List<Character> allChaeacters;
  Function(List<Character>) searchList;
  TextEditingController searchtextcontroller = TextEditingController();
  CustomTextFormField(
      {super.key,
      required this.allChaeacters,
      required this.searchtextcontroller,
      required this.searchList});

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
      decoration: const InputDecoration(
        hintText: 'Find A Character ...',
        border: InputBorder.none,
      ),
      onChanged: (value) {
        searchForItems(value);
        widget.searchList(searchChaeacters);
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
