import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});

  final Icon icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 58, height: 58),
      fillColor: Color(0xFFFFFF),
      splashColor: Colors.red,
      focusColor: Colors.black,
      child: icon,
      elevation: 0,
    );
  }
}
