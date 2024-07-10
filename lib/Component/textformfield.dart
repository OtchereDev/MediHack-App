// ignore_for_file: must_be_immutable

import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Utils/properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class TextFormWidget extends StatefulWidget {
  TextFormWidget(this.textController, this.title, this.enabled,
      {this.isPhone = false,
      this.validate = false,
      this.validateEmail = false,
      this.inputType,
      this.validateMsg,
      this.hint,
      this.icon,
      this.iconColor,
      this.onIconTap,
      this.formater,
      this.prefixIcon,
      this.count,
      this.onValueChange,
      this.padding = const EdgeInsets.symmetric(horizontal: 8,),
      this.onTap, this.line, this.onEditComplete});
  TextEditingController textController = TextEditingController();
  final String? title, hint;
  final String? validateMsg;
  bool enabled, validateEmail, isPhone;
  bool validate;
  final void Function()? onIconTap;
  final VoidCallback? onTap;
  final VoidCallback? onEditComplete;
  final Color? iconColor;
  final IconData? icon;
  final Widget? prefixIcon;
  final EdgeInsets? padding;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formater;
  final int? count, line;
  Function(String)? onValueChange;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  bool isActive = true;
  @override
  void initState() {
    super.initState();
    // widget.textController.addListener(() {
    //   if (mounted) {
    //     setState(() {
    //       final isButtonActive = widget.textController.text.isNotEmpty;
    //       setState(() => this.isActive = isButtonActive);
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title!,
          style:  GoogleFonts.raleway(color: AppColors.HEADINGCOLOR, fontSize: 17),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          onTap: widget.onTap,
          controller: widget.textController,
          keyboardType: widget.inputType,
          onEditingComplete:widget.onEditComplete,
          maxLength: widget.count,
          onChanged: widget.onValueChange,
          inputFormatters: widget.formater,
          readOnly: widget.enabled,
          maxLines: widget.line,
          validator: (value) {
            RegExp regex = RegExp(PATTERN);
            if (widget.validateEmail && !regex.hasMatch(value!)) {
              return "Please enter a valid email address";
            }
            if(widget.validate && value!.isEmpty){
              return widget.validateMsg;
            }
            return null;
          },
          focusNode: null,
          decoration: InputDecoration(
              hintText: widget.hint,
              alignLabelWithHint: true,
              hintStyle:  GoogleFonts.raleway(color: Color(0xff94A3B8)),
              filled: true,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.icon == null
                  ? null
                  : GestureDetector(
                      onTap: widget.onIconTap,
                      child: Icon(widget.icon, color: widget.iconColor),
                    ),
              fillColor: Colors.white,
              contentPadding: widget.padding,
              enabledBorder: isActive
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: AppColors.DIFCOLOR, width: .6),
                    )
                  : InputBorder.none,
              focusedBorder: isActive
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          color: AppColors.DIFCOLOR, width: .6),
                    )
                  : InputBorder.none,
              border: isActive
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: AppColors.DIFCOLOR, width: .6),
                    )
                  : InputBorder.none,
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
              )),
        ),
      ],
    );
  }
}
