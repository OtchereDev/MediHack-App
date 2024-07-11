import 'package:flutter/material.dart';

class Dotindicator extends StatelessWidget {
  final int itemLength, pageIndex;
  const Dotindicator({super.key, required this.itemLength, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemLength,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 5,
          width: pageIndex == index ? 15 : 5, // Adjust the size of the active dot
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: pageIndex == index
                ? Colors.black
                : Colors.grey, // Adjust active and inactive dot colors
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  
  }
}