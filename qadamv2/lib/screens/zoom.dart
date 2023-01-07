import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../theme.dart';
import 'home.dart';
import 'menu.dart';

class ZoomScreen extends StatelessWidget {
  const ZoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: MenuScreen(),
      mainScreen: HomeScreen(),
      mainScreenTapClose: true,
      mainScreenScale: 0.01,
      showShadow: false,
      borderRadius: 100,
      angle: 0.0,
      slideWidth: MediaQuery.of(context).size.width*0.6,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
      menuBackgroundColor: QadamTheme.textColor07,
      style: DrawerStyle.defaultStyle,
    );
  }
}