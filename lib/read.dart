// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ReadPage extends StatefulWidget {
  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  late PDFViewController pdfViewController;

  // void _launchWebsiteUrl() async {
  //   if (await canLaunch(
  //       "https://repository.dinus.ac.id/docs/ajar/Software_Engineering_-_Pressman.pdf")) {
  //     await launch(
  //         "https://repository.dinus.ac.id/docs/ajar/Software_Engineering_-_Pressman.pdf"); // Membuka link website
  //   } else {
  //     throw 'Tidak dapat membuka link: https://repository.dinus.ac.id/docs/ajar/Software_Engineering_-_Pressman.pdf';
  //   }
  // }

  Future<void> showCitateDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Silahkan copy sitasi dibawah'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                SelectableText(
                  "Pressman, R. S. (2014). Software engineering: A practitioner's approach (8th ed.). McGraw-Hill.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detail Buku',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61JuC+epPFL.jpg",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Software Engineering : \nA Practitioner Approach",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Penulis  :',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(width: 16.0),
                                Text(
                                  'Pressman',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Deskripsi  : Presents an engineering approach for the analysis, design, and testing of web applications. This book provides information on software tools, specific work flow for specific kinds of projects, and information on various topics. It includes resources for both instructors and students such as checklists, 700 categorized web references, and more.',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.justify,
                            )
                          ])),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: const Text('PDF Viewer'),
                                backgroundColor: Colors.black,
                              ),
                              body: PDFView(
                                filePath:
                                    'https://repository.dinus.ac.id/docs/ajar/Software_Engineering_-_Pressman.pdf',
                                enableSwipe: true,
                                swipeHorizontal: true,
                                autoSpacing: false,
                                pageSnap: false,
                                onError: (e) {
                                  print(e);
                                },
                                onRender: (pages) {
                                  setState(() {});
                                },
                                onViewCreated: (PDFViewController vc) {
                                  pdfViewController = vc;
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text('Read'),
                    ),
                    const SizedBox(width: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange, // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: () {
                        showCitateDialog();
                      },
                      child: const Text('Citate'),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
