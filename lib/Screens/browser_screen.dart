import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_downloder/Controller/webView_controller.dart';
import 'package:youtube_downloder/Downloader/downloader.dart';

// ignore: must_be_immutable
class BrowserScreen extends StatelessWidget {
  var controllerWebView = WebviewController();

  String youTubeLink = 'https://www.youtube.com';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controllerWebView.webViewController.canGoBack()) {
          controllerWebView.webViewController.goBack();
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Obx(
            () => WebView(
              initialUrl: youTubeLink,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                controllerWebView.webViewController = controller;
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () async {
              final url = await controllerWebView.webViewController.currentUrl();
              final title = await controllerWebView.webViewController.getTitle();
              Downloader().downloadVideo(url, '$title');
            },
            child: Icon(Icons.download_rounded),
          ),
        ),
      ),
    );
  }
}
