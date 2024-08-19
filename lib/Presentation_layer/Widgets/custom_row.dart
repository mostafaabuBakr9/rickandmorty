import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String property;
  final String value;

  const CustomRow({super.key, required this.property, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black12),
            child: Center(
                child: Text(property,
                    style: const TextStyle(fontWeight: FontWeight.bold)))),
        Container(
            width: 160,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black12),
            child: Center(
                child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ))),
      ],
    );
  }
}
