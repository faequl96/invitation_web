import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:invitation_web/app.dart';
import 'package:invitation_web/view_model.dart';

void main() {
  initializeDateFormatting("id_ID");
  setupLocator();

  runApp(const App());
}
