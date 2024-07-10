import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/firestore.dart';
import 'package:invitation_web/models/db_models/rsvp.dart';
import 'package:invitation_web/models/position_value.dart';
import 'package:invitation_web/view_model.dart';
import 'package:just_audio/just_audio.dart';

String toCapitalize(String value) {
  List<String> values = value.split("-");
  String returnValue = "";
  for (int i = 0; i < values.length; i++) {
    if (i == 0) {
      returnValue +=
          "${values[i].toUpperCase()[0]}${values[i].toLowerCase().replaceRange(0, 1, "")}";
    } else {
      returnValue +=
          " ${values[i].toUpperCase()[0]}${values[i].toLowerCase().replaceRange(0, 1, "")}";
    }
  }

  return returnValue;
}

String toUnderScore(String value) => value.replaceAll("-", "_");

double s(Enum type, double sm, double md, double lg, double xl) {
  final Map<Enum, double> mapOfSize = {
    H.Sm: sm,
    H.Md: md,
    H.Lg: lg,
    H.Xl: xl,
    W.Sm: sm,
    W.Md: md,
    W.Lg: lg,
    W.Xl: xl
  };
  return mapOfSize[type] ?? 0;
}

void initViewModel(BuildContext context, ViewModel vM) {
  vM.toName = Uri.base.queryParameters["to"] ?? "";
  vM.instance = Uri.base.queryParameters["instance"] ?? "";

  vM.s = MediaQuery.of(context).size;
  if (vM.s.width > 480) vM.s = const Size(400, 720);

  if (vM.s.height <= 660) {
    vM.h = H.Sm;
  } else if (vM.s.height > 660 && vM.s.height <= 720) {
    vM.h = H.Md;
  } else if (vM.s.height > 720 && vM.s.height <= 780) {
    vM.h = H.Lg;
  } else if (vM.s.height > 780) {
    vM.h = H.Xl;
  }

  if (vM.s.width <= 360) {
    vM.w = W.Sm;
  } else if (vM.s.width > 360 && vM.s.width <= 376) {
    vM.w = W.Md;
  } else if (vM.s.width > 376 && vM.s.width <= 392) {
    vM.w = W.Lg;
  } else if (vM.s.width > 392) {
    vM.w = W.Xl;
  }

  vM.fract = vM.s.height / 20;

  vM.shakeTimer ??= Timer.periodic(const Duration(milliseconds: 150), (_) {
    if (vM.shakeTurns == -0.02) {
      vM.shakeTurns = 0.02;
    } else {
      vM.shakeTurns = -0.02;
    }
  });

  _initCountdownPosition(vM);
  _setupAudioPlayer(vM);
  precacheImage(const AssetImage("assets/landing_bg_left.png"), context);
  precacheImage(const AssetImage("assets/kelir_jawa_rose_gold.png"), context);
  precacheImage(const AssetImage("assets/landing_bg_right.png"), context);
  precacheImage(const AssetImage("assets/kelir_jawa_gold.png"), context);
  precacheImage(const AssetImage("assets/default_bg.png"), context);
  precacheImage(const AssetImage("assets/unifying_frame.png"), context);
  precacheImage(const AssetImage("assets/bismillah.png"), context);
  precacheImage(const AssetImage("assets/frame_top_left.png"), context);
  precacheImage(const AssetImage("assets/frame_bottom_right.png"), context);
  precacheImage(const AssetImage("assets/groom.png"), context);
  precacheImage(const AssetImage("assets/bride.png"), context);
}

void _setupAudioPlayer(ViewModel vM) async {
  vM.player = AudioPlayer();
  await vM.player.setAudioSource(AudioSource.asset("assets/its_you.mp3"));
  // vM.player.play();
}

void _initCountdownPosition(ViewModel vM) {
  vM.cdPosition1 = PositionValue(
    xAxis: s(vM.w, 48, 52, 56, 60),
    yAxis: s(vM.h, 202, 218, 234, 250),
  );
  vM.cdPosition2 = PositionValue(
    xAxis: s(vM.w, 68, 72, 76, 80) +
        ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4),
    yAxis: s(vM.h, 202, 218, 234, 250),
  );

  vM.cdPositionY2 = 50 + 140 * 2;
}

void setAnimated(ViewModel vM) async {
  vM.animatedType = AnimatedType.T2;
  await Future.delayed(const Duration(milliseconds: 300));
  vM.animatedType = AnimatedType.T3;
  await Future.delayed(const Duration(milliseconds: 300));
}

void superLogic(ViewModel vM) {
  vM.sV = vM.pageController.offset;

  final double divideds = vM.s.height / vM.s.width;
  vM.bgPositionX = (vM.sV / divideds) / 2;

  if (vM.sV > 0 && vM.sV <= vM.s.height / 3) {
    vM.cdPosition1 = PositionValue(
      xAxis: s(vM.w, 48, 52, 56, 60) + vM.sV,
      yAxis: s(vM.h, 202, 218, 234, 250),
    );
    vM.cdPosition2 = PositionValue(
      xAxis: (s(vM.w, 68, 72, 76, 80) +
              ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4)) +
          vM.sV,
      yAxis: s(vM.h, 202, 218, 234, 250),
    );
  } else if (vM.sV > vM.s.height / 3 && vM.sV <= (vM.s.height / 3) * 2) {
    vM.cdPosition1 = PositionValue(
      xAxis: ((vM.s.width / 2) -
          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)),
      yAxis: s(vM.h, 202, 218, 234, 250) - (vM.sV - (vM.s.height / 3)),
    );
    vM.cdPosition2 = PositionValue(
      xAxis: ((vM.s.width / 2) -
          (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)),
      yAxis: s(vM.h, 202, 218, 234, 250) - (vM.sV - (vM.s.height / 3)),
    );
  } else if (vM.sV > (vM.s.height / 3) * 2 && vM.sV <= (vM.s.height / 3) * 3) {
    vM.cdPosition1 = PositionValue(
      xAxis: ((vM.s.width / 2) -
              (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)) -
          (vM.sV - ((vM.s.height / 3) * 2)),
      yAxis: s(vM.h, 202, 218, 234, 250) - (vM.sV - (vM.s.height / 3)),
    );
    vM.cdPosition2 = PositionValue(
      xAxis: ((vM.s.width / 2) -
              (((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4) / 2)) -
          (vM.sV - ((vM.s.height / 3) * 2)),
      yAxis: s(vM.h, 202, 218, 234, 250) - (vM.sV - (vM.s.height / 3)),
    );
  }

  if (vM.sV <= vM.s.height) {
    if (vM.sV <= 10) vM.swipeUpViewState += 1;

    if (vM.sV <= vM.fract) {
      vM.opacity = 1;
      vM.flash = 1;
    } else if (vM.sV > vM.fract && vM.sV <= vM.fract * 2) {
      vM.opacity = 0.94;
      vM.flash = 0.88;
    } else if (vM.sV > vM.fract * 2 && vM.sV <= vM.fract * 3) {
      vM.opacity = 0.88;
      vM.flash = 0.76;
    } else if (vM.sV > vM.fract * 3 && vM.sV <= vM.fract * 4) {
      vM.opacity = 0.82;
      vM.flash = 0.64;
    } else if (vM.sV > vM.fract * 4 && vM.sV <= vM.fract * 5) {
      vM.opacity = 0.76;
      vM.flash = 0.52;
    } else if (vM.sV > vM.fract * 5 && vM.sV <= vM.fract * 6) {
      vM.opacity = 0.70;
      vM.flash = 0.40;
    } else if (vM.sV > vM.fract * 6 && vM.sV <= vM.fract * 7) {
      vM.opacity = 0.64;
      vM.flash = 0.28;
    } else if (vM.sV > vM.fract * 7 && vM.sV <= vM.fract * 8) {
      vM.opacity = 0.58;
      vM.flash = 0.16;
    } else if (vM.sV > vM.fract * 8 && vM.sV <= vM.fract * 9) {
      vM.opacity = 0.52;
      vM.flash = 0.04;
    } else if (vM.sV > vM.fract * 9 && vM.sV <= vM.fract * 10) {
      vM.opacity = 0.46;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 10 && vM.sV <= vM.fract * 11) {
      vM.opacity = 0.40;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 11 && vM.sV <= vM.fract * 12) {
      vM.opacity = 0.34;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 12 && vM.sV <= vM.fract * 13) {
      vM.opacity = 0.28;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 13 && vM.sV <= vM.fract * 14) {
      vM.opacity = 0.22;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 14 && vM.sV <= vM.fract * 15) {
      vM.opacity = 0.16;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 15 && vM.sV <= vM.fract * 16) {
      vM.opacity = 0.10;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 16 && vM.sV <= vM.fract * 17) {
      vM.opacity = 0.04;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 17 && vM.sV <= vM.fract * 18) {
      vM.opacity = 0;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 18 && vM.sV <= vM.fract * 19) {
      vM.opacity = 0;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 19 && vM.sV <= vM.fract * 20) {
      vM.opacity = 0;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 20 && vM.sV <= vM.fract * 21) {
      vM.opacity = 0;
      vM.flash = 0;
    }
  }

  if (vM.sV > vM.s.height && vM.sV <= vM.s.height * 2) {
    if (vM.sV - vM.s.height <= 140) {
      vM.cdPositionY1 = 50;
    } else if (vM.sV - vM.s.height > 140 && vM.sV - vM.s.height <= 280) {
      vM.cdPositionY1 = 50 + ((vM.sV - vM.s.height) - 140) * 2;
      vM.cdPositionY2 = 50 + 140 * 2;
    } else if (vM.sV - vM.s.height > 280 && vM.sV - vM.s.height <= 420) {
      vM.cdPositionY1 = 331;
      vM.cdPositionY2 = (50 + 140 * 2) - ((vM.sV - vM.s.height) - 280) * 2;
    } else if (vM.sV - vM.s.height > 420 &&
        vM.sV - vM.s.height <= vM.s.height) {
      vM.cdPositionY2 = 50;
    }

    vM.countdownViewState += 1;
  }

  if (vM.sV > vM.s.height * 2 && vM.sV <= vM.s.height * 3) {
    vM.cdPositionY2 = 50 + (vM.sV - vM.s.height * 2);

    if (vM.sV <= vM.s.height * 2 + 240) {
      vM.cdPositionY21 = 50 + (vM.sV - vM.s.height * 2);
    } else if (vM.sV > vM.s.height * 2 + 240) {
      vM.cdPositionY21 = 195 - ((vM.sV - vM.s.height * 2 - 289) * 2);
    }
    if (vM.sV <= vM.s.height * 2 + 270) {
      vM.cdPositionY22 = 50 + (vM.sV - vM.s.height * 2);
    } else if (vM.sV > vM.s.height * 2 + 270) {
      vM.cdPositionY22 = 225 - ((vM.sV - vM.s.height * 2 - 319) * 2);
    }
    if (vM.sV <= vM.s.height * 2 + 300) {
      vM.cdPositionY23 = 50 + (vM.sV - vM.s.height * 2);
    } else if (vM.sV > vM.s.height * 2 + 300) {
      vM.cdPositionY23 = 255 - ((vM.sV - vM.s.height * 2 - 349) * 2);
    }
    if (vM.sV <= vM.s.height * 2 + 320) {
      vM.cdPositionY24 = 50 + (vM.sV - vM.s.height * 2);
    } else if (vM.sV > vM.s.height * 2 + 320) {
      vM.cdPositionY24 = 275 - ((vM.sV - vM.s.height * 2 - 369) * 2);
    }

    vM.cdPositionY1 = vM.sV -
        (vM.s.height * 3 -
            ((vM.s.width - s(vM.w, 156, 164, 172, 180)) / 4 + 50));

    if (vM.sV == vM.s.height * 3) {
      if (vM.page4Marked == 0) setAnimated(vM);
    } else if (vM.sV < vM.s.height * 3) {
      vM.page4Marked = 0;
      vM.animatedType = AnimatedType.T1;
    }

    vM.countdownViewState += 1;
  }

  if (vM.sV > vM.s.height * 3 && vM.sV <= vM.s.height * 4) {
    vM.page4Marked = 1;
    if (vM.sV <= vM.s.height * 3 + 10) vM.countdownViewState += 1;
    if (vM.sV > vM.s.height * 4 - 10) vM.countdownViewState += 1;
  }

  if (vM.sV > vM.s.height * 4 && vM.sV <= vM.s.height * 5) {
    vM.cdPositionY3 = vM.sV - vM.s.height * 4;
    vM.countdownViewState += 1;
  }

  if (vM.sV > vM.s.height * 5 && vM.sV <= vM.s.height * 6) {}

  // if (vM.sV > vM.s.height * 2 && vM.sV <= vM.s.height * 3) {
  //   if (vM.sV - (vM.s.height * 2) <= vM.fract) {
  //     vM.opacity = 1;
  //     vM.flash = 1;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 2) {
  //     vM.opacity = 0.95;
  //     vM.flash = 0.85;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 2 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 3) {
  //     vM.opacity = 0.9;
  //     vM.flash = 0.7;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 3 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 4) {
  //     vM.opacity = 0.85;
  //     vM.flash = 0.55;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 4 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 5) {
  //     vM.opacity = 0.8;
  //     vM.flash = 0.4;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 5 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 6) {
  //     vM.opacity = 0.75;
  //     vM.flash = 0.25;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 6 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 7) {
  //     vM.opacity = 0.7;
  //     vM.flash = 0.1;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 7 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 8) {
  //     vM.opacity = 0.65;
  //     vM.flash = 0;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 8 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 9) {
  //     vM.opacity = 0.6;
  //     vM.flash = 0;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 9 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 10) {
  //     vM.opacity = 0.55;
  //     vM.flash = 0;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 10 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 11) {
  //     vM.opacity = 0.5;
  //     vM.flash = 0;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 11 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 12) {
  //     vM.opacity = 0.45;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 12 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 13) {
  //     vM.opacity = 0.4;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 13 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 14) {
  //     vM.opacity = 0.35;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 14 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 15) {
  //     vM.opacity = 0.3;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 15 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 16) {
  //     vM.opacity = 0.25;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 16 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 17) {
  //     vM.opacity = 0.2;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 17 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 18) {
  //     vM.opacity = 0.15;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 18 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 19) {
  //     vM.opacity = 0.1;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 19 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 20) {
  //     vM.opacity = 0.05;
  //   } else if (vM.sV - (vM.s.height * 2) > vM.fract * 20 &&
  //       vM.sV - (vM.s.height * 2) <= vM.fract * 21) {
  //     vM.opacity = 0;
  //   }
  // }
}

void saveToDB(ViewModel vM, RSVP rsvp) async {
  vM.isBusy = true;
  final docGuest = invitedGuests.doc(
    "${toUnderScore(vM.toName)}__${toUnderScore(vM.instance)}",
  );

  final rsvps = docGuest.collection("RSVPs");

  final docRSVPs = rsvps
      .withConverter(
        fromFirestore: RSVP.fromFirestore,
        toFirestore: (RSVP city, options) => city.toFirestore(),
      )
      .doc("RSVPs_${rsvp.dateTime}");

  await docRSVPs.set(rsvp);
  vM.isBusy = false;
}
