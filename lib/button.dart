import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color tColor, bColor;
  final Function? press;

  const ButtonWidget(
      {Key? key,
      this.text,
      required this.tColor,
      required this.bColor,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      elevation: 0,
      color: bColor,
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      onPressed: () {
        press!();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text!,
          style: TextStyle(
              color: tColor,
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
