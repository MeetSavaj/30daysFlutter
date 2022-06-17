import 'package:flutter/material.dart';
import 'package:test_1/pages/home_page.dart';
import 'package:test_1/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/utils/routes.dart';
import 'package:test_1/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.drakTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
