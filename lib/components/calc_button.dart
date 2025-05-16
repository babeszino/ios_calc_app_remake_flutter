import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final Function() onPressed;
  final bool isWide;
  final IconData? icon;

  const CalcButton({
    super.key,
    this.text = "",
    this.backgroundColor = const Color.fromARGB(255, 43, 42, 42),
    this.textColor = Colors.white,
    this.fontSize = 40.0,
    required this.onPressed,
    this.isWide = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonSize = MediaQuery.of(context).size.width / 4 - 12;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(buttonSize / 2),
      splashColor: Colors.white24,
      highlightColor: Colors.white10,
      child: Container(
        width: isWide ? buttonSize * 2 + 8 : buttonSize,
        height: buttonSize,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: isWide ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isWide ? BorderRadius.circular(buttonSize / 2) : null,
        ),
        child: Center(
          child:
              icon != null
                  ? Icon(icon, color: textColor, size: 46)
                  : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
        ),
      ),
    );
  }
}
