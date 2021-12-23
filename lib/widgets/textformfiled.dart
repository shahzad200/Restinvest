import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:investintrust/utils/constant.dart';

class CustomFormField extends StatefulWidget {
  CustomFormField(
      {Key? key,
        required this.hint,
        this.textInputType = TextInputType.emailAddress,
        required this.onTextChange,
        this.obscureText = false,
        this.fieldType = 2,
        this.textAlign = TextAlign.start,
        this.controller,
        this.icon,
        this.isRounded=true,
        this.hasIcon = true})
      : super(key: key);
  final String hint;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final Function(String) onTextChange;
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
    return TextFormField(controller: widget.controller,
      obscuringCharacter: "*",
      decoration: InputDecoration(



          contentPadding: const EdgeInsets.all(10.0),
          border:  _inputBorder(widget.isRounded) ,
          disabledBorder: _inputBorder(widget.isRounded),
          enabledBorder:widget.isRounded?  _inputBorder(widget.isRounded):null,
          errorBorder: _inputBorder(widget.isRounded),
          focusedBorder: _inputBorder(widget.isRounded),
          focusedErrorBorder: _inputBorder(widget.isRounded),
          filled: true,
          hintText: widget.hint,hintStyle:const TextStyle(color: AppColor.black,fontWeight: FontWeight.bold),
          fillColor: Colors.white),
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText,
      textAlign: TextAlign.center,
      cursorColor: AppColor.blueColor,
      validator: (val) {
        switch (widget.fieldType) {
          case Constants.emailField:
            {
              if (val!.isEmpty) {
                return "Please enter the email ";
              }

               else {
                return null;
              }
            }
          case Constants.passwordField:
            {
              if (val!.isEmpty) {
                return "Please enter the password";

              } else if (val.length >= 5) {
                return "Password must be at least 6 character in length.";

              } else {
                return null;
              }
            }
          case Constants.phoneNumberField:
            {
              if (val!.isEmpty) {
                return  "Please enter the phone number";
              } else {
                return null;
              }
            }
          case Constants.name:
            {
              if (val!.isEmpty) {
                return "Please enter the  name";
              } else {
                return null;
              }
            }
          case Constants.fathername:
            {
              if (val!.isEmpty) {
                return "Please enter the father name";
              } else {
                return null;
              }
            }
          case Constants.userId:
            {
              if (val!.isEmpty) {
                return "Please enter the user Id";
              } else {
                return null;
              }
            } case Constants.cnicNumber:
          {
            if (val!.isEmpty) {
              return "Please enter the cnic number";
            } else {
              return null;
            }

          }
          case Constants.accountNo:
            {
              if (val!.isEmpty) {
                return "Please enter the account number";
              } else {
                return null;
              }

            }
          case Constants.pincode:
            {
              if (val!.isEmpty) {
                return "Please enter the pin code";
              } else {
                return null;
              }

            }
          case Constants.cityname:
            {
              if (val!.isEmpty) {
                return "";
              } else {
                return null;
              }

            }
          case Constants.faxnumber:
            {
              if (val!.isEmpty) {
                return "Please enter the  fax number";
              } else {
                return null;
              }

            }
          case Constants.passportnumber:
            {
              if (val!.isEmpty) {
                return "Please enter the  passport number";
              } else {
                return null;
              }

            }
          case Constants.ntnnumber:
            {
              if (val!.isEmpty) {
                return "Please enter the  ntn number";
              } else {
                return null;
              }

            }
          case Constants.cellnumber:
            {
              if (val!.isEmpty) {
                return "Please enter the  cell number";
              } else {
                return null;
              }

            }
          case Constants.username:
            {
              if (val!.isEmpty) {
                return "Please enter the user name";
              } else {
                return null;
              }

            }

          default:
            {}
        }
      },
      onChanged: (text) {
        widget.onTextChange(text);
      },
      onSaved: (val) {},
    );
  }

  InputBorder _inputBorder(isRounded) {
    return OutlineInputBorder(
      borderSide:  BorderSide(width: isRounded ? 0.5 : 2, color: AppColor.dimblack),
      borderRadius: BorderRadius.circular(isRounded?10:10,),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {Key? key,
      this.label,
      this.hintColor,
      this.hint,
      this.textAlign = TextAlign.start,
      this.textInputType = TextInputType.emailAddress,
      this.validations,
      this.onChange,
      this.obscureText = false,
      this.fieldType = 2,
      this.controller,
      this.textcolor,
      this.icon,
      this.color = AppColor.dimblack,
      this.isRounded = true,
      this.hasIcon = true})
      : super(key: key);
  final String? label;
  final String? hint;
  final hintColor;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final Function(String)? validations;
  final Function(String)? onChange;
  bool obscureText;
  final int fieldType;
  final IconData? icon;
  final textcolor;
  final bool hasIcon;
  final TextEditingController? controller;
  final bool isRounded;
  final Color color;
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
        contentPadding: EdgeInsets.all(9),
        border: _inputBorder(widget.isRounded),
        disabledBorder: _inputBorder(widget.isRounded),
        enabledBorder: widget.isRounded ? _inputBorder(widget.isRounded) : null,
        errorBorder: _inputBorder(widget.isRounded),
        focusedBorder: _inputBorder(widget.isRounded),
        focusedErrorBorder: _inputBorder(widget.isRounded),
        filled: true,
        labelText: widget.label,
        hintText: widget.hint,hintStyle: TextStyle(color: AppColor.black),
        fillColor: AppColor.whiteColor,
      ),
      keyboardType: widget.textInputType,
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      validator: (val) {
        widget.validations!(val!);
      },
      onChanged: (val) {},
      onSaved: (val) {},
    );
  }

  InputBorder _inputBorder(isRounded) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: isRounded ? 1 : 2, color: widget.color),
      borderRadius: BorderRadius.circular(
        isRounded ? 0 : 0,
      ),
    );
  }
}
