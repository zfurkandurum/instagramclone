import 'package:flutter/material.dart';
import 'package:instagramclone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobilScreenLayout;

  const ResponsiveLayout({
    super.key,
    required this.webScreenLayout,
    required this.mobilScreenLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > screenSizes().webScreenSize) {
          return webScreenLayout;
        }
        return mobilScreenLayout;
      },
    );
  }
}
