import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: FilledButton(
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
        child: const Text(
          "History",
          style: TextStyle(color: Color.fromRGBO(1, 57, 255, 1)),
        ),
      ),
    );
  }
}
