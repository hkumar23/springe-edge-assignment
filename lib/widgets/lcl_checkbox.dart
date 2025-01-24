import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class LclCheckbox extends StatefulWidget {
  const LclCheckbox({
    super.key,
  });

  @override
  State<LclCheckbox> createState() => _LclCheckboxState();
}

class _LclCheckboxState extends State<LclCheckbox> {
  bool _isLclChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLclChecked = !_isLclChecked;
        });
      },
      child: Row(
        children: [
          CustomCheckbox(
            isChecked: _isLclChecked,
          ),
          const SizedBox(width: 8),
          const Text(
            "LCL",
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
