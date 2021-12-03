import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:investintrust/utils/constant.dart';

class CustomFormField extends StatefulWidget {
  CustomFormField(
      {Key? key,
      this.label,
      this.hint,
      this.textAlign = TextAlign.start,
      this.textInputType = TextInputType.emailAddress,
      this.validations,
      this.onChange,
      this.obscureText = false,
      this.fieldType = 2,
      this.controller,
      this.icon,
      this.isRounded = true,
      this.hasIcon = true})
      : super(key: key);
  final String? label;
  final String? hint;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final Function(String)? validations;
  final Function(String)? onChange;
  bool obscureText;
  final int fieldType;
  final IconData? icon;
  final bool hasIcon;
  final bool isRounded;
  final TextEditingController? controller;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColor.blueColor,
      cursorHeight: 20,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          border: _inputBorder(widget.isRounded),
          disabledBorder: _inputBorder(widget.isRounded),
          enabledBorder:
              widget.isRounded ? _inputBorder(widget.isRounded) : null,
          errorBorder: _inputBorder(widget.isRounded),
          focusedBorder: _inputBorder(widget.isRounded),
          focusedErrorBorder: _inputBorder(widget.isRounded),
          filled: true,
          labelText: widget.label,
          hintText: widget.hint,
          fillColor: AppColor.whiteColor),
      keyboardType: widget.textInputType,
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      validator: (val) {},
      onChanged: (val) {},
      onSaved: (val) {},
    );
  }

  InputBorder _inputBorder(isRounded) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(width: isRounded ? 0.5 : 2, color: AppColor.dimblack),
      borderRadius: BorderRadius.circular(
        isRounded ? 10 : 10,
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {Key? key,
      this.label,
      this.textColor,
      this.hint,
      this.textAlign = TextAlign.start,
      this.textInputType = TextInputType.emailAddress,
      this.validations,
      this.onChange,
      this.obscureText = false,
      this.fieldType = 2,
      this.controller,
      this.icon,
      this.isRounded = true,
      this.hasIcon = true})
      : super(key: key);
  final String? label;
  final String? hint;
  final textColor;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final Function(String)? validations;
  final Function(String)? onChange;
  bool obscureText;
  final int fieldType;
  final IconData? icon;
  final bool hasIcon;
  final bool isRounded;
  final TextEditingController? controller;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColor.blueColor,
      cursorHeight: 20,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        isDense: true, // Added this
        contentPadding: EdgeInsets.all(10),
        border: _inputBorder(widget.isRounded),
        disabledBorder: _inputBorder(widget.isRounded),
        enabledBorder: widget.isRounded ? _inputBorder(widget.isRounded) : null,
        errorBorder: _inputBorder(widget.isRounded),
        focusedBorder: _inputBorder(widget.isRounded),
        focusedErrorBorder: _inputBorder(widget.isRounded),
        filled: true,
        labelText: widget.label,
        hintText: widget.hint,
        fillColor: AppColor.whiteColor,
      ),
      keyboardType: widget.textInputType,
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      validator: (val) {},
      onChanged: (val) {},
      onSaved: (val) {},
    );
  }

  InputBorder _inputBorder(isRounded) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(width: isRounded ? 0.8 : 2, color: AppColor.dimblack),
      borderRadius: BorderRadius.circular(
        isRounded ? 0 : 0,
      ),
    );
  }
}
