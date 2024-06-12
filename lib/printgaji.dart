import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
//import 'buildprint.dart';

//MEMBUAT TAMPILAN BUTTON
class PrintPdf extends StatelessWidget {
  const PrintPdf({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          //maximumSize: Size(10, 10),

          backgroundColor: Color.fromRGBO(254, 194, 194, 100),
          minimumSize: Size(double.infinity, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      onPressed: () => printDoc(),
      child: Text(
        "Print Slip Gaji",
      ),
    );
  }

//MEMBUAT FUNGSI PRINT
  void printDoc() async {
    final image =
    await imageFromAssetBundle('assets/print.jpg');
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(child: pw.Image(image));
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }
}