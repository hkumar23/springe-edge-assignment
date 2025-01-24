import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CutOffDateField extends StatefulWidget {
  const CutOffDateField({
    super.key,
    required this.title,
    required this.assetPath,
    required this.isPrefix,
  });
  final String title;
  final String? assetPath;
  final bool isPrefix;

  @override
  State<CutOffDateField> createState() => _CutOffDateFieldState();
}

class _CutOffDateFieldState extends State<CutOffDateField> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _textEditingController.text =
            DateFormat('dd-MM-yyyy').format(pickedDate);
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      onTap: () async {
        await _pickDate(context);
      },
      decoration: InputDecoration(
        hintText: widget.title,
        suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(widget.assetPath!)),
        suffixIconConstraints:
            const BoxConstraints(maxHeight: 40, maxWidth: 40),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 14,
        ),
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
