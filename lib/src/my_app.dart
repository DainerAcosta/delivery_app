import 'package:delivery_app/src/routes/pages.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: FontStyles.textTheme,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: primaryColor,
          textTheme: CupertinoTextThemeData(
            textStyle: FontStyles.normal,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColorMaterial)
            .copyWith(secondary: primaryColor),
      ),
      initialRoute: Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}
