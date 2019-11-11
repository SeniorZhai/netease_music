import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './route/navigate_service.dart';
import './pages/splash_page.dart';
import './route/routes.dart';

import 'application.dart';
import 'utils/log_util.dart';

void main() {
  Router router = new Router();
  Routes.configureRoutes(router);

  Application.router = router;
  Application.setupLocator();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider<UserModel>.value(
      //   value: UserModel(),
      // ),
      // ChangeNotifierProvider<PlaySongsModel>(
      //   builder: (_) => PlaySongsModel()..init(),
      // ),
      // ChangeNotifierProvider<PlayListModel>(
      //   builder: (_) => PlayListModel(),
      // ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Application.getIt<NavigateService>().key,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          splashColor: Colors.transparent,
          tooltipTheme: TooltipThemeData(verticalOffset: -100000)),
      home: SplashPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
