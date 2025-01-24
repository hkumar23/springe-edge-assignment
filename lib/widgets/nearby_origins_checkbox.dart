import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class NearByOriginsCheckbox extends StatefulWidget {
  const NearByOriginsCheckbox({
    super.key,
  });

  @override
  State<NearByOriginsCheckbox> createState() => _NearByOriginsCheckboxState();
}

class _NearByOriginsCheckboxState extends State<NearByOriginsCheckbox> {
  bool _includeNearbyOrigins = false;
  // void _toggleIncludeNearbyDestinations() {
  //   _includeNearbyOrigins = !_includeNearbyOrigins;
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _includeNearbyOrigins = !_includeNearbyOrigins;
            });
          },
          child: CustomCheckbox(
            isChecked: _includeNearbyOrigins,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "Include nearby destination ports",
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
