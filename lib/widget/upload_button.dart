import 'package:flutter/material.dart';

class UploadButtonWidget extends StatelessWidget {
  final IconData icon;
 // final String text;
  final VoidCallback onClicked;

  const UploadButtonWidget({
    Key? key,
    required this.icon,
   // required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey.shade800,
      //    minimumSize: Size.fromHeight(50),
        ),
        child: buildContent(),
        onPressed: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_upload_outlined, size: 25,color: Colors.white,),
          SizedBox(width: 10),
        ],
      );
}
