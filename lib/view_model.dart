import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:invitation_web/enum/enums.dart';

final GetIt locator = GetIt.instance;
void setupLocator() => locator.registerSingleton<ViewModel>(ViewModel());

class ViewModel extends ChangeNotifier {
  // hType
  H h = H.Sm;

  // wType
  W w = W.Sm;

  // size
  Size s = const Size(0, 0);
}
