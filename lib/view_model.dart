import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/models/position_value.dart';

final GetIt locator = GetIt.instance;
void setupLocator() => locator.registerSingleton<ViewModel>(ViewModel());

class ViewModel extends ChangeNotifier {
  final PageController pageController = PageController();

  String toName = "";
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
}
