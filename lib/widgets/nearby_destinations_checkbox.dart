import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class NearByDestinationsCheckBox extends StatefulWidget {
  const NearByDestinationsCheckBox({
    super.key,
  });

  @override
  State<NearByDestinationsCheckBox> createState() =>
      _NearByDestinationsCheckBoxState();
}

class _NearByDestinationsCheckBoxState
    extends State<NearByDestinationsCheckBox> {
  bool _includeNearbyDestinations = false;
  // void _toggleIncludeNearbyDestinations() {
  //   _includeNearbyDestinations = !_includeNearbyDestinations;
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _includeNearbyDestinations = !_includeNearbyDestinations;
            });
          },
          child: CustomCheckbox(
            isChecked: _includeNearbyDestinations,
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
