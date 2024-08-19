import 'package:flutter/material.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/app_bar_action_Search_icon.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_text_form_field.dart';

class CustomAppBar extends StatefulWidget {
  bool issearching;
  Function()? onPressed;
  final TextEditingController textEditingController;
  final List<Character> allChaeacters;
  CustomAppBar(
      {super.key,
      required this.issearching,
      required this.textEditingController,
      required this.allChaeacters,
      this.onPressed});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      actions: [
        AppBarActionSearchIcon(
          isSearch: widget.issearching,
          textEditingController: widget.textEditingController,
          onPressed: widget.onPressed,
        )
      ],
      title: widget.issearching
          ? CustomTextFormField(allChaeacters: widget.allChaeacters)
          : const Text(
              'Rick and Morty',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
