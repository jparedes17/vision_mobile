import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vision_proyecto/theme/app.theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewWidgetGlobal extends StatefulWidget {
  const WebViewWidgetGlobal({Key? key, required this.urlPage})
      : super(key: key);
  final String urlPage;

  @override
  State<WebViewWidgetGlobal> createState() => _WebViewWidgetGlobalState();
}

class _WebViewWidgetGlobalState extends State<WebViewWidgetGlobal> {
  late final WebViewController _controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color.fromARGB(0, 255, 17, 17))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (url.contains('https://visioncuc.com/')) {
              Future.delayed(const Duration(milliseconds: 10), () {
                controller.runJavaScript(
                    "document.getElementsByTagName('header')[0].style.display='none';");
                controller.runJavaScript(
                    "document.getElementsByTagName('footer')[0].style.display='none';");
              });
            }
            
              setState(() {
                isLoading = false;
              });
            
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://visioncuc.com/')) {
              return NavigationDecision.navigate;
            } else if (request.url.startsWith(
                'https://visioncuc.com/wp-content/uploads/2023/04/Agenda-Programatica-Vision-2023_compressed.pdf')) {
              _launchUrl(request.url);
              return NavigationDecision.prevent;
            } else {
              _launchUrl(request.url);
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.urlPage));

      if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      WebViewWidget(controller: _controller),
      isLoading
          ? Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(image: AssetImage('assets/vision_2023_logo.png')),
                    CircularProgressIndicator(
                      strokeWidth: 6,
                      color: Apptheme.secundary,
                    ),
                  ],
                ),
              ))
          : Stack(),
    ]);
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $widget.urlPage');
    }
  }
}
