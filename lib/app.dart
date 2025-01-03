import 'package:flutter/material.dart';
import 'package:invitation_web/methods/methods.dart';
import 'package:invitation_web/views/app_view.dart';
import 'package:invitation_web/view_model.dart';
import 'package:invitation_web/views/audio_player/audio_player.dart';
import 'package:watch_it/watch_it.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    initViewModel(context, di<ViewModel>());
    final ViewModel vM = di<ViewModel>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            height: vM.s.height,
            width: vM.s.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            clipBehavior: Clip.hardEdge,
            child: const AppView(),
          ),
        ),
        floatingActionButton: const AudioPlayerWidget(),
      ),
    );
  }
}
