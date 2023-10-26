import 'package:flutter/material.dart';

class SearchBarr extends StatelessWidget {
  const SearchBarr(
      {super.key,
      required this.hintText,
      this.prefix,
      this.suffix,
      required this.filledColor,
      this.onSaved,
      this.onFieldSubmitted,
      this.controller,
      this.validator});
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final Color filledColor;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: suffix,
        filled: true,
        fillColor: filledColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
