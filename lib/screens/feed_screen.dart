import 'package:flutter/material.dart';
import 'package:instagramclone/utils/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagramclone/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

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
            onPressed: () {},
            icon: const Icon(Icons.messenger_outline_outlined),
          )
        ],
      ),
      body: const PostCard(),
    );
  }
}
