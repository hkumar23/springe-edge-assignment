import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class FclCheckbox extends StatefulWidget {
  const FclCheckbox({
    super.key,
  });

  @override
  State<FclCheckbox> createState() => _FclCheckboxState();
}

class _FclCheckboxState extends State<FclCheckbox> {
  bool _isFclChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFclChecked = !_isFclChecked;
        });
      },
      child: Row(
        children: [
          CustomCheckbox(
            isChecked: _isFclChecked,
          ),
          const SizedBox(width: 8),
          const Text(
            "FCL",
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
