import 'package:flutter/cupertino.dart';

import 'package:flutter_components/pages/AlertPage.dart';
import 'package:flutter_components/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es')
      ],
      localeResolutionCallback: (locale, supportedLocales){
          return locale;
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationsRouets(),
      onGenerateRoute: (RouteSettings settings){
        return CupertinoPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      } ,
    );
  }
}