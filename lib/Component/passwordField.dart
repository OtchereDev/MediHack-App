import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.fieldKey,
    @required this.hintText,
    this.onSaved,
    this.validate = false,
    this.removeBorder = false,
    this.onFieldSubmitted,
    required this.controller,
    required this.validateMsg,
    this.focusNode,
    required this.inputType,
    this.title,
    this.rightWidget,
  });
  final Key? fieldKey;
  final String? hintText, title, validateMsg;
  final FormFieldSetter<String>? onSaved;
  final bool? validate, removeBorder;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController controller;
  final TextInputType? inputType;
  final Widget? rightWidget;

  final FocusNode? focusNode;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  // bool isActive = true;
  // bool _isPasswordMoreThanEight = false;
  // bool _hasNumber = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      // final regEx = RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])');
      if (mounted) {
        setState(() {
         
          // if (widget.controller.text.length >= 8) {
          //   _isPasswordMoreThanEight = true;
          // }
          // _hasNumber = false;
          // if (regEx.hasMatch(widget.controller.text)) {
          //   _hasNumber = true;
          // }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? "",
          style:
               GoogleFonts.raleway(color: AppColors.HEADINGCOLOR, fontSize: 17),
        ),
      const SizedBox(
          height: 10,
        ),
        TextFormField(
          key: widget.fieldKey,
          obscureText: _obscureText,
          onSaved: widget.onSaved,
          keyboardType: widget.inputType,
          validator: (value) {
            if (value!.isEmpty && widget.validate!) {
              return widget.validateMsg;
            }
            // if (!_hasNumber && widget.validate!) {
            //   return "Password must have at least one special charater ";
            // }
            if (value.length < 8 && widget.validate!) {
              return "Password must be atleast eight characters";
            }
            return null;
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          // style: TextStyle(color: Color(0xffF7F7F7)),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffFBFBFB),
            contentPadding: const EdgeInsets.only(left: 10, top: 15),
            hintText: widget.hintText,
            focusColor: const Color(0xffF7F7F7),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.all(14.0),
            //   child: SvgPicture.asset(
            //     "assets/icons/lock.svg",
            //     color: AppColors.DIFCOLOR,
            //   ),
            // ),

            labelStyle: const TextStyle(color: AppColors.ASHDEEP),
            // contentPadding: EdgeInsets.only(left: 10),
            hintStyle:  GoogleFonts.raleway(
              color: AppColors.DIFCOLOR,
            ),

            enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppColors.DIFCOLOR, width: .6),
                  )
      ,
            focusedBorder: 
                 OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppColors.DIFCOLOR, width: .6),
                  ),
                // : InputBorder.none,
            border: 
                 OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppColors.DIFCOLOR, width: .6),
                  ),
                // : InputBorder.none,
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 0.6,
                color: Colors.red,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: .6),
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Icon(
                          FeatherIcons.eye,
                          color: AppColors.DIFCOLOR,
                        ))
                    : const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Icon(
                          FeatherIcons.eyeOff,
                          color: AppColors.DIFCOLOR,
                        ))),
          ),
        ),
         widget.rightWidget ?? const SizedBox.shrink(),
         widget.rightWidget == null ?   const SizedBox(
          height: 10,
        ): const SizedBox.shrink(),
      ],
    );
  }
}
