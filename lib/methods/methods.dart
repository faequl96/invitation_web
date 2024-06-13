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
