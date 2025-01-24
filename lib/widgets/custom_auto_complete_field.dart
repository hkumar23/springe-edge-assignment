import 'package:flutter/material.dart';

import '../models/university.model.dart';

class CustomAutoCompleteField extends StatelessWidget {
  const CustomAutoCompleteField({
    super.key,
    required this.universities,
    required this.title,
  });
  final List<University>? universities;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<University>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return [];
        }
        if (universities == null) {
          return [];
        }
        return universities!.where((option) {
          if ([
            option.alphaTwoCode,
            option.country,
            option.name,
          ].any((element) => element
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()))) {
            return true;
          }
          if (option.domains.any((element) => element
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()))) {
            return true;
          }
          if (option.webPages.any((element) => element
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()))) {
            return true;
          }
          return false;
        });
      },
      displayStringForOption: (University option) => option.name,
      onSelected: (University university) {
        print('Selected: ${university.name}');
      },
      optionsViewBuilder: (
        context,
        onSelected,
        options,
      ) {
        final textTheme = Theme.of(context).textTheme;
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 3,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.black38,
                      offset: Offset(0, 5))
                ],
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);
                  return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(option.name, style: textTheme.titleMedium),
                          Text(
                            "${option.country}, ${option.alphaTwoCode}",
                            style: textTheme.bodyMedium,
                          ),
                          // Text(option.stateProvince, style: textTheme.bodyMedium),
                          const SizedBox(height: 10)
                        ],
                      ));
                },
              ),
            ),
          ),
        );
      },
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onFieldSubmitted,
      ) {
        return Expanded(
          child: TextField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: title,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset("assets/icons/location.png"),
              ),
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 40, maxWidth: 40),
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
          ),
        );
      },
    );
  }
}
