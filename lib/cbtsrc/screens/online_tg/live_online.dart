import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../test_generator/test_home/model_test_generator.dart';
import 'online_tg_controller.dart';

Future<Uint8List> generateDocumentLiveOnline(PdfPageFormat format,
    PaperGenerationModel data, OnlineTgController controller) async {
  final doc = pw.Document(
      pageMode: PdfPageMode.outlines, title: controller.nameController.text);

  final font1 = await PdfGoogleFonts.notoSansDevanagariRegular();
  final font2 = await PdfGoogleFonts.notoSansDevanagariBold();
  final shape = await rootBundle.loadString('assets/svg/document.svg');
  final swirls = await rootBundle.loadString('assets/svg/swirls2.svg');

  // final font = await rootBundle.load("fonts/hindi_font.ttf");
  // final font = await rootBundle.load("assets/fonts/Kruti-Dev-010.ttf");
  // final ttf = pw.Font.ttf(font);

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

          return pw.Container(
              alignment: pw.Alignment.center,
              margin: const pw.EdgeInsets.only(bottom: 1.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 1.0 * PdfPageFormat.mm),
              decoration: const pw.BoxDecoration(
                  border: pw.Border(
                      bottom:
                      pw.BorderSide(width: 0.5, color: PdfColors.grey))),
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
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: <pw.Widget>[
                          pw.Text(
                              'Total Marks : ${controller.marksOfQ.value ?? "0"}',
                              textScaleFactor: 1,
                              style: pw.Theme.of(context).defaultTextStyle),
                          pw.Text(
                              'Total Time : ${controller.durationController.text} Minute ',
                              textScaleFactor: 1),
                        ]),
                    pw.SizedBox(height: 8),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: <pw.Widget>[
                          pw.Text(
                              "${controller.sharedValue.value.trim() == "Student" ? 'Student Name : ...............' : ""}",
                              textScaleFactor: 1,
                              style: pw.Theme.of(context).defaultTextStyle),
                          pw.Text(
                              "${controller.sharedValue.value.trim() == "Student" ? 'Marks Obtained : .............' : ""}",
                              textScaleFactor: 1),
                        ])
                  ]));
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
      build: (pw.Context context) => getList(data, controller, font1)));

  return await doc.save();
}

getList(PaperGenerationModel data, OnlineTgController controller, pw.Font ttf) {
  List<pw.Widget> dat = List.empty(growable: true);
  for (int index = 0; index < controller.getPaperQuestion().length; index++) {
    dat.add(pw.Column(children: getList2(data, controller, index, ttf)
      // [
      // pw.Text(
      //     '${index + 1} ${controller.getPaperQuestion()[index].type.prName ?? ""}'),
      // pw.Paragraph(text: '${controller.getSubSerial(i + 1) ?? ""}' +
      //     '  ${controller.getPaperQuestion()[index].mainQuestion[i].prQuestion ?? ""}')

      // getList2(data, controller, index)
      // ]
    ));
  }
  return dat;
}

List<pw.Widget> getList2(PaperGenerationModel data, OnlineTgController controller,
    int index, pw.Font ttf) {
  List<pw.Widget> dat = List.empty(growable: true);
  for (int i = 0;
  i < controller.getPaperQuestion()[index].mainQuestion.length;
  i++) {
    // dat.add(pw.Paragraph(
    //     text: '${controller.getSubSerial(i + 1) ?? ""}' +
    //         '  ${controller.getPaperQuestion()[index].mainQuestion[i].prQuestion ?? ""}'));

    dat.add(
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          if (i == 0)
            pw.Text(
                '${index + 1} ${controller.getPaperQuestion()[index].type.prName ?? ""}',style: pw.TextStyle(font: ttf)),
          pw.Paragraph(
              text: '   ${controller.getSubSerial(i + 1) ?? ""}' +
                  '  ${controller.getPaperQuestion()[index].mainQuestion[i].prQuestion ?? ""}',style: pw.TextStyle(font: ttf)),
          //
          //
          //
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                if (controller
                    .getPaperQuestion()[index]
                    .mainQuestion[i]
                    .prDescription!
                    .isEmpty)
                  pw.Text(
                      '${controller.getPaperQuestion()[index].mainQuestion[i].prDescription ?? ""}',style: pw.TextStyle( font: ttf)),
                if (controller
                    .getPaperQuestion()[index]
                    .mainQuestion[i]
                    .prFirstOption!
                    .isNotEmpty)
                  pw.Text(
                      '${controller.getPaperQuestion()[index].mainQuestion[i].prFirstOption ?? ""}',style: pw.TextStyle(font: ttf)),
                // '(a) ${controller.getPaperQuestion()[index].mainQuestion[i].prFirstOption ?? ""}'),
                if (controller
                    .getPaperQuestion()[index]
                    .mainQuestion[i]
                    .prSecondOption!
                    .isNotEmpty)
                  pw.Text(
                      '${controller.getPaperQuestion()[index].mainQuestion[i].prSecondOption ?? ""}',style: pw.TextStyle( font: ttf)),
                // '(b) ${controller.getPaperQuestion()[index].mainQuestion[i].prSecondOption ?? ""}'),
                if (controller
                    .getPaperQuestion()[index]
                    .mainQuestion[i]
                    .prThirdOption!
                    .isNotEmpty)
                  pw.Text(
                      '${controller.getPaperQuestion()[index].mainQuestion[i].prThirdOption ?? ""}',style: pw.TextStyle(font: ttf)),
                // '(c) ${controller.getPaperQuestion()[index].mainQuestion[i].prThirdOption ?? ""}'),
                if (controller
                    .getPaperQuestion()[index]
                    .mainQuestion[i]
                    .prFourthOption!
                    .isNotEmpty)
                  pw.Text(
                      '${controller.getPaperQuestion()[index].mainQuestion[i].prFourthOption ?? ""}',style: pw.TextStyle( font: ttf)),
                // '(d) ${controller.getPaperQuestion()[index].mainQuestion[i].prFourthOption ?? ""}'),
                if (controller
                    .getPaperQuestion()[index]
                    .mainQuestion[i]
                    .prFifthOption!
                    .isNotEmpty)
                  pw.Text(
                      '${controller.getPaperQuestion()[index].mainQuestion[i].prFifthOption ?? ""}',style: pw.TextStyle(font: ttf)),
                // '(e) ${controller.getPaperQuestion()[index].mainQuestion[i].prFifthOption ?? ""}'),
              ]),
          if (controller.sharedValue.value.trim() != "Student")
            pw.Text(
                '    ${"Answer : "}' +
                    '  ${controller.getPaperQuestion()[index].mainQuestion[i].prAnswer ?? ""}',
                style: pw.TextStyle(color: PdfColors.green, font: ttf))
        ]));
  }
  return dat;
}