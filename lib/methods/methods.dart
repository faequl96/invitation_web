import 'package:invitation_web/enum/enums.dart';

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

double h(H heightType, double sm, double md, double lg, double xl) {
  switch (heightType) {
    case H.Sm:
      return sm;
    case H.Md:
      return md;
    case H.Lg:
      return lg;
    case H.Xl:
      return xl;
  }
}

double w(W widthType, double sm, double md, double lg, double xl) {
  switch (widthType) {
    case W.Sm:
      return sm;
    case W.Md:
      return md;
    case W.Lg:
      return lg;
    case W.Xl:
      return xl;
  }
}
