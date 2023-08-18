import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testing/webviewx_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewx/webviewx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WebViewXPage(),
    );
  }
}

class JavaScriptRenderer extends StatefulWidget {
  const JavaScriptRenderer({super.key, required this.javascriptCode});
  final String javascriptCode;

  @override
  State<JavaScriptRenderer> createState() => _JavaScriptRendererState();
}

class _JavaScriptRendererState extends State<JavaScriptRenderer> {
  // late WebViewController controller;
  late WebViewXController webviewController;
  @override
  void initState() {
    super.initState();
    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       // onNavigationRequest: (NavigationRequest request) {
    //       //   if (request.url.startsWith('https://www.youtube.com/')) {
    //       //     return NavigationDecision.prevent;
    //       //   }
    //       //   return NavigationDecision.navigate;
    //       // },
    //     ),
    //   )
    //   ..loadRequest(
    //     Uri.dataFromString(
    //       widget.javascriptCode,
    //       mimeType: 'text/html',
    //       encoding: Encoding.getByName('utf-8'),
    //     ),
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JavaScript Renderer'),
      ),
      // body: WebView(
      //   initialUrl: 'about:blank',

      //   onWebViewCreated: (WebViewController webViewController) {
      //     // Load the JavaScript code into the WebView
      //     webViewController.loadUrl(Uri.dataFromString(
      //       javascriptCode,
      //       mimeType: 'text/html',
      //       encoding: Encoding.getByName('utf-8'),
      //     ).toString());
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // WebViewWidget(controller: controller),
            const WebViewXPage(),
            Text(widget.javascriptCode, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

const String code = '''<!DOCTYPE html>
<html>
<head>
    <title>Even or Odd Checker</title>
</head>
<body>
    <h1>Even or Odd Checker</h1>
    <input type="text" id="numberInput" placeholder="Enter a number">
    <button onclick="checkEvenOrOdd()">Check</button>
    <p id="result"></p>

    <script>
        function checkEvenOrOdd() {
            var inputNumber = parseInt(document.getElementById("numberInput").value);
            var resultElement = document.getElementById("result");

            if (isNaN(inputNumber)) {
                resultElement.textContent = "Please enter a valid number.";
            } else {
                if (inputNumber % 2 === 0) {
                    resultElement.textContent = inputNumber + " is even.";
                } else {
                    resultElement.textContent = inputNumber + " is odd.";
                }
            }
        }
    </script>
</body>
</html>''';
