import 'package:calendar_app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'routing/routes.dart';

void main() {
  runApp(
    ProviderScope(
      child: CalendarApp(),
    ),
  );
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      initialRoute: RouteGenerator.homeView,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomeView(),
    );
  }
}
