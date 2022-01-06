import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey.shade800,
          minimumSize: Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          child: buildContent(),
          onPressed: onClicked,
      );

  Widget buildContent() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 28,color: Colors.grey.shade400,),
      SizedBox(width: 10),
      Text(
        text,
        style: TextStyle(fontSize: 22, color: Colors.grey.shade400),
     ),

    ]);
}
