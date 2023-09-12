import 'package:flutter/cupertino.dart';
import 'package:instagramclone/screens/add_post_screen.dart';
import 'package:instagramclone/screens/feed_screen.dart';
import 'package:instagramclone/screens/profile_screen.dart';
import 'package:instagramclone/screens/search_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text("notif"),
  ProfileScreen(),
];
