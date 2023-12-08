import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';


class CbtWebView extends StatefulWidget {
  final String url;
  final String pdfUrl;
  final String title;

  const CbtWebView({Key? key, this.url = "", this.title = "", this.pdfUrl = ""})
      : super(key: key);

  @override
  _CbtWebViewState createState() =>
      _CbtWebViewState(url: url, title: title, pdfUrl: pdfUrl);
}

class _CbtWebViewState extends State<CbtWebView> {
  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  String url;
  String pdfUrl;
  String title;

  _CbtWebViewState({this.url = "", this.title = "", this.pdfUrl = ""});

  // late WebViewXController webviewController;
  final initialContent = 'https://www.google.com/';

  // final initialContent =
  //     '<h4> This is some hardcoded HTML code embedded inside the webview <h4> <h2> Hello world! <h2>';
  final executeJsErrorMessage =
      'Failed to execute this task because the current content is (probably) URL that allows iframe embedding, on Web.\n\n'
      'A short reason for this is that, when a normal URL is embedded in the iframe, you do not actually own that content so you cant call your custom functions\n'
      '(read the documentation to find out why).';

  String? employeeID;

  Size get screenSize => MediaQuery.of(context).size;
  String pathPDF = "";
  static const int _initialPage = 1;

  @override
  void initState() {
    super.initState();

    // if(pdfUrl.isNotEmpty){
    //   createFileOfPdfUrl().then((f) {
    //     setState(() {
    //       pathPDF = f.path;
    //       print(pathPDF);
    //     });
    //   });
    // }
  }

  @override
  void dispose() {
    // webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return /*pdfUrl.isNotEmpty
        ? PDFViewerScaffold(
            appBar: CbtAppBar(title: title),
            path: pdfUrl)
        :*/
        Scaffold(
      appBar: title.isNotEmpty
          ? CbtAppBar(
              title: title,
            )
          : null,
      body: /*pdfUrl.isNotEmpty
          ? Container(
            child: PDFViewerCachedFromUrl(
              url: "http://demo.codebright.in//media/file-data/Hindi%20Vyakaran%20TB%2010.pdf",
            ) )*//*SizedBox(
            child: SfPdfViewer.network(
                pdfUrl,
                canShowScrollHead: true,
                key: _pdfViewerKey,
              ),
          )*/
          /*:*/ SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: WebView(
                url,
                aspectRatio: 16 / 8,
              ),
            ),
    );
  }

  // Widget _buildWebViewX(String url) {
  //   return WebViewX(
  //     key: const ValueKey('webviewx'),
  //     initialContent: url,
  //     initialSourceType: SourceType.url,
  //     height: screenSize.height,
  //     width: min(screenSize.width * 1, 2048),
  //     onWebViewCreated: (controller_view_all.dart) => webviewController = controller_view_all.dart,
  //     // onPageStarted: (src) => _setUrlBypass(url),
  //     // onPageFinished: (src) => {},
  //     onPageFinished: (src) => webviewController.clearCache(),
  //     jsContent: const {
  //       EmbeddedJsContent(
  //         js: "function testPlatformIndependentMethod() { console.log('Hi from JS') }",
  //       ),
  //       EmbeddedJsContent(
  //         webJs:
  //             "function testPlatformSpecificMethod(msg) { TestDartCallback('Web callback says: ' + msg) }",
  //         mobileJs:
  //             "function testPlatformSpecificMethod(msg) { TestDartCallback.postMessage('Mobile callback says: ' + msg) }",
  //       ),
  //     },
  //     dartCallBacks: {
  //       DartCallback(name: 'TestDartCallback', callBack: (msg) => {})
  //     },
  //     webSpecificParams: const WebSpecificParams(
  //       printDebugInfo: true,
  //     ),
  //     mobileSpecificParams: const MobileSpecificParams(
  //       androidEnableHybridComposition: true,
  //     ),
  //     navigationDelegate: (navigation) {
  //       webviewController.clearCache();
  //       return NavigationDecision.navigate;
  //     },
  //   );
  // }
  //
  // void _setUrl(String url) {
  //   webviewController.loadContent(
  //     url,
  //     SourceType.url,
  //   );
  //   // webviewController.clearCache();
  // }
  //
  // void _setUrlBypass(String url) {
  //   // webviewController.clearCache();
  //   webviewController.loadContent(
  //     url,
  //     SourceType.urlBypass,
  //   );
  // }
  //
  // void _setHtml() {
  //   webviewController.loadContent(
  //     initialContent,
  //     SourceType.html,
  //   );
  // }
  //
  // void _setHtmlFromAssets() {
  //   webviewController.loadContent(
  //     'assets/test.html',
  //     SourceType.html,
  //     fromAssets: true,
  //   );
  // }
  //
  // Future<void> _goForward() async {
  //   if (await webviewController.canGoForward()) {
  //     await webviewController.goForward();
  //   } else {}
  // }
  //
  // Future<void> _goBack() async {
  //   if (await webviewController.canGoBack()) {
  //     await webviewController.goBack();
  //   } else {}
  // }
  //
  // void _reload() {
  //   webviewController.reload();
  // }
  //
  // void _toggleIgnore() {
  //   final ignoring = webviewController.ignoresAllGestures;
  //   webviewController.setIgnoreAllGestures(!ignoring);
  //   // showSnackBar('Ignore events = ${!ignoring}', context);
  // }
  //
  // Future<void> _evalRawJsInGlobalContext() async {
  //   try {
  //     final result = await webviewController.evalRawJavascript(
  //       '2+2',
  //       inGlobalContext: true,
  //     );
  //   } catch (e) {}
  // }
  //
  // Future<void> _callPlatformIndependentJsMethod() async {
  //   try {
  //     await webviewController.callJsMethod('testPlatformIndependentMethod', []);
  //   } catch (e) {
  //     // showAlertDialog(
  //     //   executeJsErrorMessage,
  //     //   context,
  //     // );
  //   }
  // }
  //
  // Future<void> _callPlatformSpecificJsMethod() async {
  //   try {
  //     await webviewController
  //         .callJsMethod('testPlatformSpecificMethod', ['Hi']);
  //   } catch (e) {
  //     // showAlertDialog(
  //     //   executeJsErrorMessage,
  //     //   context,
  //     // );
  //   }
  // }
  //
  // Future<void> _getWebviewContent() async {
  //   try {
  //     final content = await webviewController.getContent();
  //     // showAlertDialog(content.source, context);
  //   } catch (e) {
  //     // showAlertDialog('Failed to execute this task.', context);
  //   }
  // }

  Widget buildSpace({
    Axis direction = Axis.horizontal,
    double amount = 0.2,
    bool flex = true,
  }) {
    return flex
        ? Flexible(
            child: FractionallySizedBox(
              widthFactor: direction == Axis.horizontal ? amount : null,
              heightFactor: direction == Axis.vertical ? amount : null,
            ),
          )
        : SizedBox(
            width: direction == Axis.horizontal ? amount : null,
            height: direction == Axis.vertical ? amount : null,
          );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;

  String? get webViewUserAgent => 'My app';
}



class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({Key? key, required this.url, required this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CbtAppBar(
        title: title,
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
