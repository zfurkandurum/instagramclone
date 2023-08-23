import 'package:flutter/material.dart';
import 'package:instagramclone/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:instagramclone/models/users.dart' as model;

class mobilScreenLayout extends StatefulWidget {
  const mobilScreenLayout({super.key});

  @override
  State<mobilScreenLayout> createState() => _mobilScreenLayoutState();
}

class _mobilScreenLayoutState extends State<mobilScreenLayout> {
  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(
        child: Text(user!.bio),
      ),
    );
  }
}
