import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/utils/color.dart';

class mobilScreenLayout extends StatefulWidget {
  const mobilScreenLayout({super.key});

  @override
  State<mobilScreenLayout> createState() => _mobilScreenLayoutState();
}

class _mobilScreenLayoutState extends State<mobilScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("this is mobil"),
      ),
      bottomNavigationBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
          backgroundColor: primaryColor,
        ),
      ]),
    );
  }
}
