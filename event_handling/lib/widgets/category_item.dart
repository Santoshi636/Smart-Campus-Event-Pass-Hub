import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search events...',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: hintText,

        prefixIcon: const Icon(
          Icons.search,
          color: Colors.deepPurple,
        ),

        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
