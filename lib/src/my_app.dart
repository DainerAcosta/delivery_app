import 'package:delivery_app/src/routes/pages.dart';
import 'package:delivery_app/src/ui/global_controllers/my_cart_controller.dart';
import 'package:delivery_app/src/utils/colors.dart';
import 'package:delivery_app/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCartController>(
            create: (_) => MyCartController()),
      ],
      child: MaterialApp(
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
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: primaryColorMaterial)
                  .copyWith(secondary: primaryColor),
        ),
        initialRoute: Pages.INITIAL,
        routes: Pages.routes,
      ),
    );
  }
}
