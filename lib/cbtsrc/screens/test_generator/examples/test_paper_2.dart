import 'dart:typed_data';

import 'package:digigyan/cbtsrc/screens/test_generator/data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generateDocument2(
    PdfPageFormat format, CustomData data) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final shape = await rootBundle.loadString('assets/svg/document.svg');
  final swirls = await rootBundle.loadString('assets/svg/swirls2.svg');

  doc.addPage(
    pw.Page(
      pageTheme: pw.PageTheme(
        pageFormat: format.copyWith(
          marginBottom: 0,
          marginLeft: 0,
          marginRight: 0,
          marginTop: 0,
        ),
        orientation: pw.PageOrientation.portrait,
        buildBackground: (context) =>
            pw.SvgImage(svg: shape, fit: pw.BoxFit.fill),
        theme: pw.ThemeData.withFont(
          base: font1,
          bold: font2,
        ),
      ),
      build: (context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(
            left: 60,
            right: 60,
            bottom: 30,
          ),
          child: pw.Column(
            children: [
              pw.Spacer(),
              pw.RichText(
                  text: pw.TextSpan(children: [
                pw.TextSpan(
                  text: '${DateTime.now().year}\n',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.grey600,
                    fontSize: 40,
                  ),
                ),
                pw.TextSpan(
                  text: 'Portable Document Format',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ])),
              pw.Spacer(),
              pw.Container(
                alignment: pw.Alignment.topRight,
                height: 150,
                child: pw.PdfLogo(),
              ),
              pw.Spacer(flex: 2),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.UrlLink(
                  destination: 'https://wikipedia.org/wiki/PDF',
                  child: pw.Text(
                    'https://wikipedia.org/wiki/PDF',
                    style: const pw.TextStyle(
                      color: PdfColors.pink100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  doc.addPage(
    pw.Page(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      build: (context) {
        return pw.Column(
          children: [
            pw.Center(
              child: pw.Text('Table of content',
                  style: pw.Theme.of(context).header0),
            ),
            pw.SizedBox(height: 20),
            pw.TableOfContent(),
            pw.Spacer(),
            pw.Center(
                child: pw.SvgImage(
                    svg: swirls, width: 100, colorFilter: PdfColors.grey)),
            pw.Spacer(),
          ],
        );
      },
    ),
  );

  doc.addPage(pw.MultiPage(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return pw.SizedBox();
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.Border(
                    bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey))),
            child: pw.Text('Portable Document Format',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => getList()));

  return await doc.save();
}

getList() {
  List<pw.Widget> dat = List.empty(growable: true);
  for (int i = 0; i < 100; i++) {
    dat.add(pw.Paragraph(
        text:
            'The Portable Document Format (PDF) is a file format developed by Adobe in the 1990s to present documents, including text formatting and images, in a manner independent of application software, hardware, and operating systems. Based on the PostScript language, each PDF file encapsulates a complete description of a fixed-layout flat document, including the text, fonts, vector graphics, raster images and other information needed to display it. PDF was standardized as an open format, ISO 32000, in 2008, and no longer requires any royalties for its implementation.'));
  }
  return dat;
}
