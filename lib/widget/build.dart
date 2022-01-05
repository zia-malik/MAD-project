import 'package:firebase_upload_example/model/firebase_file.dart';
import 'package:firebase_upload_example/page/image_page.dart';
import 'package:flutter/material.dart';

Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        leading: Container(
          margin: EdgeInsets.all(3),
          child: Image.network(
            file.url,
            width: 100,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          file.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.grey.shade400,
          ),
        ),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ImagePage(file: file),
        )),
      );

  Widget buildHeader(int length) => ListTile(
        tileColor: Colors.grey.shade700,
        leading: Container(
          width: 52,
          height: 52,
          child: Icon(
            Icons.file_copy,
            color: Colors.white,
          ),
        ),
        title: Text(
          '$length Files',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );