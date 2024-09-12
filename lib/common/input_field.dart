import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool capitalize;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  const InputFieldWidget(
      {required this.hintText,
        required this.icon,
        Key? key,
        this.textInputAction = TextInputAction.done,
        this.keyboardType = TextInputType.text,
        this.capitalize = false,
        required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextCapitalization textCapitalization;
    if (capitalize) {
      textCapitalization = TextCapitalization.words;
    } else {
      textCapitalization = TextCapitalization.none;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.black54,
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: TextField(
              textInputAction: textInputAction,
              textCapitalization: textCapitalization,
              keyboardType: keyboardType,
              controller: controller,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
