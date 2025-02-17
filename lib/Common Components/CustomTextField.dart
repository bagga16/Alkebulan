import 'package:alkebulan/Utils/Mediaquery%20Sizer.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final bool isPassword;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? height;

  CommonTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.contentPadding,
    this.prefixIcon,
    this.maxLines,
    this.height,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? MediaQueryHelper.height(context, 0.06),
      child: TextField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword ? _isObscured : false,
        maxLines: widget.maxLines ?? 1,
        onTap: widget.onTap,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: MediaQueryHelper.fontSize(context, 0.035),
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(188, 186, 186, 1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(188, 186, 186, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(188, 186, 186, 1)),
          ),
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(
                horizontal: MediaQueryHelper.width(context, 0.04),
                vertical: MediaQueryHelper.height(context, 0.008),
              ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
