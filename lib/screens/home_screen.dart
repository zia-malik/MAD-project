
import 'package:firebase_upload_example/model/firebase_file.dart';
import 'package:firebase_upload_example/widget/build.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../widget/add_image.dart';
import 'package:firebase_upload_example/api/firebase_api.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('files/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text(
          MyApp.title,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade800,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddImage()));
        },
      ),
      body: FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Some error occurred!'));
              } else {
                final files = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(files.length,),
                    const SizedBox(height: 12,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          final file = files[index];

                          return buildFile(context, file);
                        },
                      ),
                    ),
                  ],
                );
              }
          }
        },
      ),
    );
  }
}