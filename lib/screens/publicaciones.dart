import 'package:flutter/material.dart';
import '../widgets/webview.dart';

class PublicacionesScreen extends StatelessWidget {
   
  const PublicacionesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebViewWidgetGlobal(urlPage: 'https://visioncuc.com/publicaciones/'),
    );
  }
}