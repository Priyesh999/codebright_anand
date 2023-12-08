import 'dart:async';
import 'dart:typed_data';
import 'package:digigyan/cbtsrc/screens/test_generator/data.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/examples/calendar.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/examples/certificate.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/examples/document.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/examples/invoice.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/examples/report.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/examples/resume.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/controller_test_home.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_generator.dart';
import 'package:pdf/pdf.dart';

import '../../online_tg/online_tg_controller.dart';

const examples = <Example>[
  Example('RÉSUMÉ', 'resume.dart', generateResume),
  Example('DOCUMENT', 'document.dart', generateDocument),
  Example('INVOICE', 'invoice.dart', generateInvoice),
  Example('REPORT', 'report.dart', generateReport),
  Example('CALENDAR', 'calendar.dart', generateCalendar),
  Example('CERTIFICATE', 'certificate.dart', generateCertificate, true),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, CustomData data);

class Example {
  const Example(this.name, this.file, this.builder, [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackWithData builder;

  final bool needsData;
}

typedef LayoutCallbackData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, PaperGenerationModel data,TestController controller);

class TestPaperPdf {
  const TestPaperPdf(this.name, this.file, this.builder,
      [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackData builder;

  final bool needsData;
}
typedef LayoutCallbackDataOnline = Future<Uint8List> Function(
    PdfPageFormat pageFormat, PaperGenerationModel data,OnlineTgController controller);

class TestPaperPdfOnline {
  const TestPaperPdfOnline(this.name, this.file, this.builder,
      [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackDataOnline builder;

  final bool needsData;
}
