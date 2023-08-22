import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/screens/login_screen.dart';
import 'package:instagramclone/utils/color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAQn0ib7bm35f0e3HxoyuFeIzCOkTiN2pI",
          appId: "1:673388084712:web:ce63fdc60b9c8a3073b85d",
          messagingSenderId: "673388084712",
          projectId: "instagramclone-7fac8"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "instagram clone",
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        //   home: const ResponsiveLayout(
        //     mobilScreenLayout: mobilScreenLayout(),
        //     webScreenLayout: webScreenLayout(),
        //   ),
        // );
        home: const LoginScreen());
  }
}
