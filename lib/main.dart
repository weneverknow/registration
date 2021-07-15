import 'package:flutter/material.dart';
import 'package:registration/theme/theme.dart';
import 'screen/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIN Finans App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply().copyWith(
              subtitle1: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white),
              caption: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white),
              headline6: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white))),
      home: Screen(),
    );
  }
}
