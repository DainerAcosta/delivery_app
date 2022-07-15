import 'package:delivery_app/src/utils/colors.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color textColor, backgroundColor, borderColor;
  final bool fullWith;
  final EdgeInsets padding;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.textColor = Colors.white,
    this.backgroundColor = primaryColor,
    this.borderColor = primaryColor,
    this.fullWith = true,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: fullWith ? double.infinity : null,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 1.4, color: borderColor)),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: FontStyles.normal.copyWith(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
