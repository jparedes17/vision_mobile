import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vision_proyecto/providers/ui_provider.dart';
import 'package:vision_proyecto/router/app_routes.dart';
import 'package:vision_proyecto/theme/app.theme.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final menu = AppRoutes.menuOptions;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/vision_2023_logo.png'),
                  fit: BoxFit.contain)
              ),
            )),
          ListView.builder(
          shrinkWrap: true,
          itemCount: menu.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    color: uiProvider.selectedMenuOpt == menu[index].position ? Colors.black : Colors.transparent,
                    child: ListTile(
                    minLeadingWidth: 10,
                    selectedColor: Apptheme.secundary,
                    selected: (uiProvider.selectedMenuOpt == menu[index].position),
                    leading: Icon(menu[index].icon),
                    title: Text(menu[index].name),
                    onTap: () {
                      uiProvider.selectedMenuOpt = menu[index].position;
                      Navigator.of(context).pop();
                    },
                    ),
                  ),
                ),
              ),
            );
          },),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(height: 30),
                const Text('Redes Sociales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Apptheme.secundary),),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () => _launchUrl("https://www.facebook.com/visioncuc"), icon: const FaIcon(FontAwesomeIcons.facebook),),
                      IconButton(onPressed: () => _launchUrl("https://www.instagram.com/visioncuc/"), icon: const FaIcon(FontAwesomeIcons.instagram)),
                      IconButton(onPressed: () => _launchUrl("https://www.youtube.com/user/UniversidadCUC1970"), icon: const FaIcon(FontAwesomeIcons.youtube)),
                      IconButton(onPressed: () => _launchUrl("https://www.linkedin.com/in/universidad-cuc-7433a048/"), icon: const FaIcon(FontAwesomeIcons.linkedin)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}