import 'package:flutter/material.dart';
import 'package:pagination_flutter/pagination.dart';

class CustomCharacterPagination extends StatefulWidget {
  final int numOfPages;
  const CustomCharacterPagination({super.key, required this.numOfPages});

  @override
  State<CustomCharacterPagination> createState() =>
      _CustomCharacterPaginationState();
}

class _CustomCharacterPaginationState extends State<CustomCharacterPagination> {
  int selectedPage = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pagination(
        numOfPages: widget.numOfPages,
        selectedPage: selectedPage,
        pagesVisible: 3,
        onPageChanged: (page) {
          setState(() {
            selectedPage = page;
          });
        },
        nextIcon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 14,
        ),
        previousIcon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 14,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        activeBtnStyle: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.black),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            ),
          ),
        ),
        inactiveBtnStyle: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          )),
        ),
        inactiveTextStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
     
  }
}
