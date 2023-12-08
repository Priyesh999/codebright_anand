import 'dart:typed_data';

import 'package:digigyan/cbtsrc/screens/test_generator/test_home/controller_test_home.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_generator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generateTestPaper(PdfPageFormat format,
    PaperGenerationModel data, TestController controller) async {
  final doc = pw.Document();

  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();
  final shape = await rootBundle.loadString('assets/svg/document.svg');
  final swirls = await rootBundle.loadString('assets/svg/swirls2.svg');

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
          // return pw.SizedBox();

          return pw.Padding(
              padding: pw.EdgeInsets.only(left: 20, right: 20, top: 20),
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  margin:
                      const pw.EdgeInsets.only(bottom: 1.0 * PdfPageFormat.mm),
                  padding:
                      const pw.EdgeInsets.only(bottom: 1.0 * PdfPageFormat.mm),
                  decoration: const pw.BoxDecoration(
                      border: pw.Border(
                          bottom: pw.BorderSide(
                              width: 0.5, color: PdfColors.grey))),
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: <pw.Widget>[
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Header(
                                  level: 0,
                                  title: controller.nameController.text,
                                  child: pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.center,
                                      children: <pw.Widget>[
                                        pw.Text(controller.nameController.text,
                                            textScaleFactor: 1.2,
                                            style: pw.Theme.of(context)
                                                .defaultTextStyle),
                                        pw.Text(
                                            "${controller.sharedValue.value.trim() == "Student" ? "Student's" : "Teacher's"} Copy",
                                            textScaleFactor: 1.2),
                                      ])),
                            ]),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: <pw.Widget>[
                              pw.Text(
                                  'Total Marks : ${data.prTotalMarks ?? "0"}',
                                  textScaleFactor: 1,
                                  style: pw.Theme.of(context).defaultTextStyle),
                              pw.Text(
                                  'Total Time : ${controller.durationController.text} Minute ',
                                  textScaleFactor: 1),
                            ]),
                        pw.SizedBox(height: 8),
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: <pw.Widget>[
                              pw.Text(
                                  "${controller.sharedValue.value.trim() == "Student" ? 'Student Name : ...............' : ""}",
                                  textScaleFactor: 1,
                                  style: pw.Theme.of(context).defaultTextStyle),
                              pw.Text(
                                  "${controller.sharedValue.value.trim() == "Student" ? 'Marks Obtained : .............' : ""}",
                                  textScaleFactor: 1),
                            ])
                      ])));
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.Border(
                    bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey))),
            child: pw.Text(data.prSubjectName ?? "",
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
      build: (pw.Context context) => <pw.Widget>[
            pw.Container(
                child: pw.ListView.builder(
                    itemBuilder: (context, index) {
                      return pw.Container(
                          child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                            pw.Text(
                                '${index + 1} ${controller.getPaperQuestion()[index].type.prName ?? ""}'),
                            pw.ListView.builder(
                                itemBuilder: (context, i) {
                                  return pw.Padding(
                                      padding: const pw.EdgeInsets.only(
                                        bottom: 3.0 * PdfPageFormat.mm,
                                        top: 3.0 * PdfPageFormat.mm,
                                        left: 5.0 * PdfPageFormat.mm,
                                        right: 5.0 * PdfPageFormat.mm,
                                      ),
                                      child: pw.Container(
                                          child: pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                            pw.Text('${controller.getSubSerial(i + 1) ?? ""}' +
                                                '  ${controller.getPaperQuestion()[index].mainQuestion[i].prQuestion ?? ""}'),
                                            pw.Row(
                                                mainAxisAlignment: pw
                                                    .MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  if (controller
                                                      .getPaperQuestion()[index]
                                                      .mainQuestion[i]
                                                      .prDescription!
                                                      .isEmpty)
                                                    pw.Text(
                                                        '${controller.getPaperQuestion()[index].mainQuestion[i].prDescription ?? ""}'),
                                                  if (controller
                                                      .getPaperQuestion()[index]
                                                      .mainQuestion[i]
                                                      .prFirstOption!
                                                      .isNotEmpty)
                                                    pw.Text(
                                                        '(a) ${controller.getPaperQuestion()[index].mainQuestion[i].prFirstOption ?? ""}'),
                                                  if (controller
                                                      .getPaperQuestion()[index]
                                                      .mainQuestion[i]
                                                      .prSecondOption!
                                                      .isNotEmpty)
                                                    pw.Text(
                                                        '(b) ${controller.getPaperQuestion()[index].mainQuestion[i].prSecondOption ?? ""}'),
                                                  if (controller
                                                      .getPaperQuestion()[index]
                                                      .mainQuestion[i]
                                                      .prThirdOption!
                                                      .isNotEmpty)
                                                    pw.Text(
                                                        '(c) ${controller.getPaperQuestion()[index].mainQuestion[i].prThirdOption ?? ""}'),
                                                  if (controller
                                                      .getPaperQuestion()[index]
                                                      .mainQuestion[i]
                                                      .prFourthOption!
                                                      .isNotEmpty)
                                                    pw.Text(
                                                        '(d) ${controller.getPaperQuestion()[index].mainQuestion[i].prFourthOption ?? ""}'),
                                                  if (controller
                                                      .getPaperQuestion()[index]
                                                      .mainQuestion[i]
                                                      .prFifthOption!
                                                      .isNotEmpty)
                                                    pw.Text(
                                                        '(e) ${controller.getPaperQuestion()[index].mainQuestion[i].prFifthOption ?? ""}'),
                                                ]),
                                            if (controller.sharedValue.value
                                                    .trim() !=
                                                "Student")
                                              pw.Text(
                                                  '${"Answer : "}' +
                                                      '  ${controller.getPaperQuestion()[index].mainQuestion[i].prAnswer ?? ""}',
                                                  style: pw.TextStyle(
                                                      color: PdfColors.green)),
                                          ])));
                                },
                                itemCount: controller
                                    .getPaperQuestion()[index]
                                    .mainQuestion
                                    .length)
                          ]));
                    },
                    itemCount: controller.getPaperQuestion().length))
          ]));

  return await doc.save();
}
