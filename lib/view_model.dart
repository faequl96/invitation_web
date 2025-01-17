import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/models/db_models/invited_guest.dart';
import 'package:invitation_web/models/db_models/rsvp.dart';
import 'package:invitation_web/models/position_value.dart';
import 'package:just_audio/just_audio.dart';
import 'package:watch_it/watch_it.dart';

void setupLocator() => di.registerSingleton<ViewModel>(ViewModel());

class ViewModel extends ChangeNotifier {
  // page controller for PageView widget
  final pageController = PageController();

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

  List<String> availableInstances = [
    "Bootcamp_Dumbways",
    "Voltras_International",
    "UIN_Jakarta",
  ];

  bool isInstanceAvailable = false;

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
  PositionValue cdPosition1 = const PositionValue(xAxis: 0, yAxis: 0);
  PositionValue cdPosition2 = const PositionValue(xAxis: 0, yAxis: 0);

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

  Timer? shakeTimer;

  final nameController = TextEditingController();
  final remarkController = TextEditingController();
  final attendanceController = TextEditingController();
  final avatarController = TextEditingController();
  final dropDownAttendanceItems = [
    "Hadir",
    "Tidak Hadir",
    "InsyaAllah Iya",
    "InsyaAllah Enggak"
  ];
  final dropDownAvatarItems = [
    "love",
    "calm",
    "unpleasant",
    "worry",
    "cry",
    "happy",
    "laughing",
    "shock",
    "pensive",
    "angry",
  ];

  bool _isLoadingSubmit = false;
  bool get isLoadingSubmit => _isLoadingSubmit;
  set isLoadingSubmit(bool value) {
    _isLoadingSubmit = value;
    notifyListeners();
  }

  bool _isLoadingSkeleton = false;
  bool get isLoadingSkeleton => _isLoadingSkeleton;
  set isLoadingSkeleton(bool value) {
    _isLoadingSkeleton = value;
    notifyListeners();
  }

  InvitedGuest? invitedGuest;

  List<RSVP> _rsvps = [];
  List<RSVP> get rsvps => _rsvps;
  set rsvps(List<RSVP> value) {
    _rsvps = value;
    notifyListeners();
  }

  List<InvitedGuest> _invitedGuests = [];
  List<InvitedGuest> get invitedGuests => _invitedGuests;
  set invitedGuests(List<InvitedGuest> value) {
    _invitedGuests = value;
    notifyListeners();
  }

  double _page6SliderHeight = 0;
  double get page6SliderHeight => _page6SliderHeight;
  set page6SliderHeight(double value) {
    _page6SliderHeight = value;
    notifyListeners();
  }

  double _page6Height = 0;
  double get page6Height => _page6Height;
  set page6Height(double value) {
    _page6Height = value;
    notifyListeners();
  }

  int _additionalPage = 0;
  int get additionalPage => _additionalPage;
  set additionalPage(int value) {
    _additionalPage = value;
    notifyListeners();
  }
}
