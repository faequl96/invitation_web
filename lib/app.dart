import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/pages/app_view.dart';
import 'package:invitation_web/view_model.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    initViewModel(context, locator<ViewModel>());

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: AppView()),
    );
  }
}
