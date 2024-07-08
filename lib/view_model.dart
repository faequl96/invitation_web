import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/models/position_value.dart';
import 'package:just_audio/just_audio.dart';

final GetIt locator = GetIt.instance;
void setupLocator() => locator.registerSingleton<ViewModel>(ViewModel());

class ViewModel extends ChangeNotifier {
  // page controller for PageView widget
  final PageController pageController = PageController();

  late AudioPlayer player;

  bool _isKeyOpened = false;
  bool get isKeyOpened => _isKeyOpened;
  set isKeyOpened(bool value) {
    _isKeyOpened = value;
    notifyListeners();
  }

  bool _isSealOpened = false;
  bool get isSealOpened => _isSealOpened;
  set isSealOpened(bool value) {
    _isSealOpened = value;
    notifyListeners();
  }

  bool _isSealOpenCompleted = false;
  bool get isSealOpenCompleted => _isSealOpenCompleted;
  set isSealOpenCompleted(bool value) {
    _isSealOpenCompleted = value;
    notifyListeners();
  }

  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;
  set isCompleted(bool value) {
    _isCompleted = value;
    notifyListeners();
  }

  // name of person invited
  String toName = "";

  // instance of the person invited
  String instance = "";

  // hType
  H h = H.Sm;

  // wType
  W w = W.Sm;

  // size
  Size s = const Size(0, 0);

  // fraction
  double fract = 0;

  // scrollValue
  double sV = 0;

  // backgroundPositionXValue
  double bgPositionX = 0;

  // opacityValue
  double opacity = 1;

  // flashValue
  double flash = 1;

  // countdownPositionValue
  PositionValue cdPosition1 = PositionValue(xAxis: 0, yAxis: 0);
  PositionValue cdPosition2 = PositionValue(xAxis: 0, yAxis: 0);

  // countdownPositionYValue
  double cdPositionY1 = 50;
  double cdPositionY2 = 0;
  double cdPositionY21 = 0;
  double cdPositionY22 = 0;
  double cdPositionY23 = 0;
  double cdPositionY24 = 0;
  double cdPositionY3 = 0;

  // for refresh UI SwipeUp widget only in FrontView widget
  int _swipeUpViewState = 0;
  int get swipeUpViewState => _swipeUpViewState;
  set swipeUpViewState(int value) {
    _swipeUpViewState = value;
    notifyListeners();
  }

  // for refresh UI CountDown widget only in FrontView widget
  int _countdownViewState = 0;
  int get countdownViewState => _countdownViewState;
  set countdownViewState(int value) {
    _countdownViewState = value;
    notifyListeners();
  }

  AnimatedType _animatedType = AnimatedType.T1;
  AnimatedType get animatedType => _animatedType;
  set animatedType(AnimatedType value) {
    _animatedType = value;
    notifyListeners();
  }

  int page4Marked = 0;

  double _shakeTurns = -0.04;
  double get shakeTurns => _shakeTurns;
  set shakeTurns(double value) {
    _shakeTurns = value;
    notifyListeners();
  }

  late final Timer? shakeTimer;
}
