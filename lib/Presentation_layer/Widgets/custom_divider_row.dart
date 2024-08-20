import 'package:flutter/material.dart';

class CustomDividerRow extends StatelessWidget {
  final String textValue;
  const CustomDividerRow({super.key, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            height: 10,
            thickness: 1,
            indent: 25,
            endIndent: 15,
            color: Colors.black,
          ),
        ),
        Text(
          textValue,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
        const Expanded(
            child: Divider(
          height: 10,
          thickness: 1,
          indent: 15,
          endIndent: 25,
          color: Colors.black,
        ))
      ],
    );
  }
}
