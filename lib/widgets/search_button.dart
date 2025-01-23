import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(
          Color.fromRGBO(230, 235, 255, 1),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(1, 57, 255, 1),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Image.asset(
          "assets/images/search-normal.png",
          height: 25,
        ),
      ),
      label: const Text(
        "Search",
        style: TextStyle(color: Color.fromRGBO(1, 57, 255, 1)),
      ),
    );
  }
}
