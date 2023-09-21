
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String hint;
  final IconData icon;

  const BuildTextField({
    super.key,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return
     Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 247, 249, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            hintText: hint,
            border: InputBorder.none,
            suffixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
