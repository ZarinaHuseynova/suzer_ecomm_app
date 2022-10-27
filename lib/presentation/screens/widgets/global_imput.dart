import 'package:flutter/material.dart';

import '../../../global/constants/app_colors.dart';

class GlobalImput extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final IconData? suffixIcon;
  final Widget prefixIcon;
  final void Function(String) onChanged;
  final String? Function(String?) validator;
  final String labelText;
  final bool isPassword;
  final bool isCorrect;
  final String hintText;

  const GlobalImput({
    Key? key,
    required this.controller,
    required this.focus,
    this.suffixIcon,
    required this.prefixIcon,
    required this.onChanged,
    required this.validator,
    required this.labelText,
    this.isPassword = false,
    required this.isCorrect,
    required this.hintText,
  }) : super(key: key);

  @override
  State<GlobalImput> createState() => _GlobalImputState();
}

class _GlobalImputState extends State<GlobalImput> {
  bool passwordObscured = true;
  //bool isCorrect = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focus,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.isPassword ? passwordObscured : false,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordObscured = !passwordObscured;
                    });
                  },
                  child: Icon(!passwordObscured
                      ? Icons.visibility
                      : Icons.visibility_off))
              : null,
          border: const OutlineInputBorder(borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: widget.isCorrect
                    ? AppColors.primaryColor
                    : AppColors.errorColor),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.errorColor))),
    );
  }
}
