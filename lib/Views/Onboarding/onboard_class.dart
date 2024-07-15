import 'package:flutter/material.dart';

class OnBoard {
  final String title, description;

  OnBoard({ required this.title, required this.description});

}





class CommonText extends StatelessWidget {
 final String text;
                  final Color?    color;
                    final double  fontSize;
                    final bool isHeader;
  const CommonText({super.key, required this.text, this.color, required this.fontSize, required this.isHeader, });

  @override
  Widget build(BuildContext context) {
    return 
     Container(
      child: Text(text, style: TextStyle(color: color, fontSize: fontSize, fontWeight:isHeader ?  FontWeight.w900 : FontWeight.w400),),
     );
  }
}