import 'package:flutter/foundation.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:invitation_web/app.dart';
import 'package:invitation_web/view_model.dart';

void main() async {
  initializeDateFormatting("id_ID");
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const App());
}
