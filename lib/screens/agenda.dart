import 'package:flutter/material.dart';

import '../widgets/webview.dart';

class AgendaScreen extends StatelessWidget {
   
  const AgendaScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebViewWidgetGlobal(urlPage: 'https://visioncuc.com/agenda/'),
    );
  }
}