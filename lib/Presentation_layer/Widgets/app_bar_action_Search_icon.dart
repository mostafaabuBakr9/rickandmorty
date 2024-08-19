import 'package:flutter/material.dart';

class AppBarActionSearchIcon extends StatelessWidget {
  final bool isSearch;
  final Function()? onPressed;
  const AppBarActionSearchIcon(
      {super.key, required this.isSearch, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (isSearch) {
      return IconButton(onPressed: onPressed, icon: const Icon(Icons.clear));
    } else {
      return IconButton(onPressed: onPressed, icon: const Icon(Icons.search));
    }
  }
}
