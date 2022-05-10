import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';

class PdfView extends StatelessWidget {
  PdfView({Key? key, this.uint8list}) : super(key: key);
  Uint8List? uint8list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Report'),
          actions: [
            InkWell(
                onTap: () async {
                  Directory directory =
                      (await getApplicationDocumentsDirectory());
                  String path = directory.path;
                  double date = DateTime.now().millisecond! / 1000;
                  File file =
                      File('$path/ReportPdf_' + date.toString() + '.pdf');
                  await file.writeAsBytes(uint8list!, flush: true);
                  Fluttertoast.showToast(
                      msg: 'Report Save Successfully' +
                          file.path +
                          '/Report.pdf',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text('Download'),
                ))),
          ],
        ),
        body: Center(
          child: SfPdfViewer.memory(uint8list!),
        ));
  }
}
