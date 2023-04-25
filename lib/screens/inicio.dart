import 'package:flutter/material.dart';
import 'package:vision_proyecto/widgets/webview.dart';

class InicioScreen extends StatelessWidget {
   
  const InicioScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebViewWidgetGlobal(urlPage: 'https://visioncuc.com/'),
    );
  }
}