import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.assetPath,
    required this.isPrefix,
  });
  final String title;
  final String? assetPath;
  final bool isPrefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 14,
        ),
        prefixIcon: assetPath == null
            ? null
            : isPrefix
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(assetPath!))
                : null,
        prefixIconConstraints: assetPath == null
            ? null
            : const BoxConstraints(maxHeight: 40, maxWidth: 40),
        suffixIcon: assetPath == null
            ? null
            : isPrefix
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(assetPath!)),
        suffixIconConstraints: assetPath == null
            ? null
            : const BoxConstraints(maxHeight: 40, maxWidth: 40),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }
}
