import 'package:flutter/material.dart';
import 'package:invitation_web/enum/enums.dart';
import 'package:invitation_web/models/position_value.dart';
import 'package:invitation_web/view_model.dart';

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
  vM.s = MediaQuery.of(context).size;

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

  initCountdownPosition(vM);
}

void initCountdownPosition(ViewModel vM) {
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

void superLogic(ViewModel vM) {
  final double divideds = vM.s.height / vM.s.width;

  vM.sV = vM.pageController.offset.ceil().toDouble();
  vM.bgPositionX = (vM.pageController.offset / divideds) / 2;

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
    if (vM.sV <= vM.fract) {
      vM.opacity = 1;
      vM.flash = 1;
    } else if (vM.sV > vM.fract && vM.sV <= vM.fract * 2) {
      vM.opacity = 0.95;
      vM.flash = 0.85;
    } else if (vM.sV > vM.fract * 2 && vM.sV <= vM.fract * 3) {
      vM.opacity = 0.9;
      vM.flash = 0.7;
    } else if (vM.sV > vM.fract * 3 && vM.sV <= vM.fract * 4) {
      vM.opacity = 0.85;
      vM.flash = 0.55;
    } else if (vM.sV > vM.fract * 4 && vM.sV <= vM.fract * 5) {
      vM.opacity = 0.8;
      vM.flash = 0.4;
    } else if (vM.sV > vM.fract * 5 && vM.sV <= vM.fract * 6) {
      vM.opacity = 0.75;
      vM.flash = 0.25;
    } else if (vM.sV > vM.fract * 6 && vM.sV <= vM.fract * 7) {
      vM.opacity = 0.7;
      vM.flash = 0.1;
    } else if (vM.sV > vM.fract * 7 && vM.sV <= vM.fract * 8) {
      vM.opacity = 0.65;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 8 && vM.sV <= vM.fract * 9) {
      vM.opacity = 0.6;
      vM.flash = 0;
    } else if (vM.sV > vM.fract * 9 && vM.sV <= vM.fract * 10) {
      vM.opacity = 0.55;
    } else if (vM.sV > vM.fract * 10 && vM.sV <= vM.fract * 11) {
      vM.opacity = 0.5;
    } else if (vM.sV > vM.fract * 11 && vM.sV <= vM.fract * 12) {
      vM.opacity = 0.45;
    } else if (vM.sV > vM.fract * 12 && vM.sV <= vM.fract * 13) {
      vM.opacity = 0.4;
    } else if (vM.sV > vM.fract * 13 && vM.sV <= vM.fract * 14) {
      vM.opacity = 0.35;
    } else if (vM.sV > vM.fract * 14 && vM.sV <= vM.fract * 15) {
      vM.opacity = 0.3;
    } else if (vM.sV > vM.fract * 15 && vM.sV <= vM.fract * 16) {
      vM.opacity = 0.25;
    } else if (vM.sV > vM.fract * 16 && vM.sV <= vM.fract * 17) {
      vM.opacity = 0.2;
    } else if (vM.sV > vM.fract * 17 && vM.sV <= vM.fract * 18) {
      vM.opacity = 0.15;
    } else if (vM.sV > vM.fract * 18 && vM.sV <= vM.fract * 19) {
      vM.opacity = 0.1;
    } else if (vM.sV > vM.fract * 19 && vM.sV <= vM.fract * 20) {
      vM.opacity = 0.05;
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
  }

  if (vM.sV > vM.s.height * 2 && vM.sV <= vM.s.height * 3) {}

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
