import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final int? maxline;

  const BuildTextField({
    super.key,
    required this.hint,
    this.icon,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(246, 247, 249, 1),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        suffixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );
  }
}
