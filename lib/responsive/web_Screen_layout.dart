import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramclone/utils/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramclone/utils/global_veriables.dart.dart';

class webScreenLayout extends StatefulWidget {
  const webScreenLayout({super.key});

  @override
  State<webScreenLayout> createState() => _webScreenLayoutState();
}

class _webScreenLayoutState extends State<webScreenLayout> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTab(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
          title: SvgPicture.asset(
            "assets/ic_instagram.svg",
            color: primaryColor,
            height: 32,
          ),
          actions: [
            IconButton(
              onPressed: () => navigationTab(0),
              icon: Icon(
                Icons.home,
                color: _page == 0 ? primaryColor : secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () => navigationTab(1),
              icon: Icon(
                Icons.search,
                color: _page == 1 ? primaryColor : secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () => navigationTab(2),
              icon: Icon(
                Icons.add_a_photo_outlined,
                color: _page == 2 ? primaryColor : secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () => navigationTab(3),
              icon: Icon(
                Icons.favorite,
                color: _page == 3 ? primaryColor : secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () => navigationTab(4),
              icon: Icon(
                Icons.person,
                color: _page == 4 ? primaryColor : secondaryColor,
              ),
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: homeScreenItems,
        ));
  }
}
