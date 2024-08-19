import 'package:flutter/material.dart';

class AppBarActionSearchIcon extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isSearch;
  final Function()? onPressed;
  const AppBarActionSearchIcon(
      {super.key,
      required this.isSearch,
      required this.textEditingController,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (isSearch) {
      return IconButton(onPressed: onPressed, icon: const Icon(Icons.clear));
    } else {
      return IconButton(onPressed: onPressed, icon: const Icon(Icons.search));
    }
  }

  void clearSearch() {
    textEditingController.clear();
  }
}
